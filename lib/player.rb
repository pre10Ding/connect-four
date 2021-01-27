# frozen_string_literal: false

# generic player interaction class
class Player
  @@players = Set.new

  def initialize(gameboard, name = "Player #{@@players.count + 1}")
    @name = name
    @gameboard = gameboard
    @@players << self
    @player_number = @@players.count
  end

  attr_reader :name, :player_number

  # checks to see if the inputted column is already full
  # columns start at 0.
  def overflown_column?(column)
    game_state = @gameboard.board_state
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
