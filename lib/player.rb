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
