# frozen_string_literal: true

require_relative '../lib/player'
require_relative '../lib/gameboard'


describe Player do
  

  # calls methods that the player uses each turn
  describe '#take_turn' do
    # no tests needed here. Individual methods will be tested.
  end

  # adds player input move to gameboard
  describe '#make_move' do
    subject(:player_move) { described_class.new }
    let(:gameboard) { instance_double(Gameboard) }

    before(:each) do
      allow(player_move).to receive(:get_input).and_return('1')
      allow(gameboard).to receive(:add_move)
    end

    context 'when players enters a valid move' do
      before do
        allow(player_move).to receive(:overflown_column?).and_return(true)
      end

      it 'gets an input from the user' do
        expect(player_move).to receive(:get_input).once
        player_move.make_move(gameboard)
      end

      it 'checks for column overflow' do
        expect(player_move).to receive(:overflown_column?).with(0, gameboard).once
        player_move.make_move(gameboard)
      end

      it 'adds it to the gameboard' do
        player_number = player_move.player_number
        expect(gameboard).to receive(:add_move).with(player_number, 0).once
        player_move.make_move(gameboard)
      end
    end

    context 'when the player enters an invalid move' do
      before do
        allow(player_move).to receive(:overflown_column?).and_return(false, false, true)
      end

      it 'does not add it to the gameboard' do
        expect(gameboard).to receive(:add_move).once
        player_move.make_move(gameboard)
      end

      it 'asks the user to enter a valid move' do
        expect(player_move).to receive(:get_input).exactly(3).times
        player_move.make_move(gameboard)
      end
    end
  end

  # validates that the entered move fits on the gameboard.
  # ie. no overflowing columns
  describe '#overflown_column?' do
    subject(:player_overflow) { described_class.new }
    let(:gameboard) { instance_double(Gameboard) }

    context 'when a player enters a move to an empty column' do
      before do
        empty_board = Array.new(7) { [] }
        allow(gameboard).to receive(:board_state).and_return(empty_board)
      end

      7.times do |player_input|
        it 'returns true' do
          return_value = player_overflow.overflown_column?(player_input, gameboard)
          expect(return_value).to be true
        end
      end
    end

    context 'when a player enters a move to a full column' do
      before do
        full_board = Array.new(7) { Array.new(6) { 1 } }
        allow(gameboard).to receive(:board_state).and_return(full_board)
      end
      it 'returns false' do
        player_input = 3
        return_value = player_overflow.overflown_column?(player_input, gameboard)
        expect(return_value).to be false
      end
    end
  end

  describe '#get_input' do
    subject(:player_input) { described_class.new }
    let(:gameboard) { instance_double(Gameboard) }

    context 'when given a question phrase to print' do
      before do
        allow(player_input).to receive(:gets).and_return('Y')
      end

      it 'prints the question to console' do
        phrase = 'Please enter the letter Y or the letter N.'
        expect(player_input).to receive(:print).with(phrase)
        player_input.get_input(phrase)
      end
    end

    context 'when given a valid input' do
      valid_input = 'Y'

      before do
        allow(player_input).to receive(:gets).and_return(valid_input)
      end

      it 'returns the valid input' do
        expect(player_input.get_input('')).to eq(valid_input)
      end
    end

    context 'when given a invalid input' do
      before do
        allow(player_input).to receive(:gets).and_return('weqwe', 'Y')
      end

      it 'asks the user to try again until a valid input is entered.' do
        expect(player_input).to receive(:puts).with('Invalid input.').once
        expect(player_input.get_input(''))
      end
    end

    context 'when the player enters SAVE or save' do
      it 'triggers the gameboard\'s save function' do
        expect(gameboard).to receive(:save_gameboard).once
      end
    end
  end

end
