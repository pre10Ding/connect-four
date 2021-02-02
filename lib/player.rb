# frozen_string_literal: false

# generic player interaction class
class Player
  @@players = Set.new

  def initialize(name = "Player #{@@players.count + 1}")
    @name = name
    @@players << self
    @player_number = @@players.count
  end

  attr_reader :name, :player_number

  def make_move(gameboard)
    prompt_phrase = "#{name}, please pick a column."
    valid_characters = %w[1 2 3 4 5 6 7]
    column = nil
    loop do
      player_input = get_input(prompt_phrase, valid_characters)
      column = player_input.to_i - 1
      break if overflown_column?(column, gameboard)
    end
    gameboard.add_move(@player_number, column)
  end

  # checks to see if the inputted column is already full
  # - should this method belong to Gameboard class?
  def overflown_column?(column, gameboard)
    game_state = gameboard.board_state
    game_state[column].length < 6
  end

  # generic input validation
  def get_input(question_to_display, valid_characters = %w[Y N])
    input = false
    loop do
      print question_to_display
      input = gets.chomp.upcase
      break if valid_characters.include?(input)

      puts 'Invalid input.'
    end
    input
  end
end
