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

  end

  # validates that the entered move fits on the gameboard.
  # ie. no overflowing columns
  describe '#overflown_column?' do
    subject(:player_overflow) { described_class.new }
    let(:gameboard) { double(Gameboard) }

    context 'when a player enters a move to an empty column' do
      before do
        empty_board = Array.new(7) { [] }
        allow(gameboard).to receive(:board_state).and_return(empty_board)
      end

      it 'returns true' do
        player_input = 3
        expect (player_overflow.overflown_column?(player_input)).to be true
      end
    end

    context 'when a player enters a move to a full column' do
      before do
        full_board = Array.new(7) { Array.new(6) { 1 } }
        allow(gameboard).to receive(:board_state).and_return(full_board)
      end
      it 'returns false' do
        player_input = 3
        expect (player_overflow.overflown_column?(player_input)).to be false
      end
    end
  end

  describe '#get_input' do
    subject(:player_input) {described_class.new}

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

      it 'should return the valid input' do
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
  end




end
