# frozen_string_literal: false

# gameboard class whose instance can store the state of a connect four game
class Gameboard
  
  def initialize(game_state = Array.new(7) { [] })
    @board_state = game_state
  end

  attr_reader :board_state, :most_recent_player

  def add_move(player_number, column)
    @board_state[column] << player_number
    @most_recent_player = player_number
    p @board_state
  end

  # saves @board_state and @most_recent_player
  def save_gameboard
  end

  # loads the @board_state and @most_recent_player from YAML file
  def load_gameboard
  end
end
