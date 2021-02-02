# frozen_string_literal: true

require_relative '../lib/gameboard'
require_relative '../lib/player'

describe Gameboard do
  subject(:game_move) { described_class.new }
  let(:player) { instance_double(Player) }

  # adds the move that the player made onto the gameboard
  describe '#add_move' do
    subject(:gameboard) { described_class.new }
    context 'when a move is added to the board' do
      it 'is stored in the appropriate column.' do
        player_number = 1
        column = 0
        expect { gameboard.add_move(player_number, column) }.to change { gameboard.board_state[column].length }.by(1)
      end

      it 'is stored with the appropriate player number.' do
        player_number = 2
        column = 1
        expect { gameboard.add_move(player_number, column) }.to change { gameboard.board_state[column] }.from([]).to([2])
      end

      game_state = Array.new(7) { [1, 2, 1, 1] }
      subject(:game_add) { described_class.new(game_state) }

      it 'is stored in order.' do
        # p game_add.instance_variable_get(:@game_state)
        player_number = 2
        column = 1
        expect { game_add.add_move(player_number, column) }.to change { game_add.board_state[column].last }.from(1).to(2)
      end

      it 'stores the player as the most recent player to make a move' do
        player_number = 1
        column = 2
        expect { gameboard.add_move(player_number, column) }.to change { gameboard.most_recent_player }.to(1)
      end
    end
  end

  # saves the gameboard and the last person to make a move
  describe '#save_gameboard' do
  end

  # loads the gameboard and returns the gameboard
  describe '#load_gameboard' do

end