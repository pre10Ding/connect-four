# frozen_string_literal: true

require_relative '../lib/connect_four'
require_relative '../lib/gameboard'
require_relative '../lib/player'

describe ConnectFour do

  describe '#play_game' do
    # Public method to control the game loop.
    # No testing needed, but each method called will be tested.
  end
  
  describe '#win?' do
    context 'when given a board that contains 4 consecutive pieces in a column from the same player' do
      it 'returns true' do
        
      end
    end

    context 'when given a board that contains 4 consecutive pieces in a row from the same player' do
      it 'returns true' do
        
      end
    end

    context 'when given a board that contains 4 consecutive pieces diagonally from top left to bottom right by the same player' do
      it 'returns true' do
        
      end
    end
    
    context 'when given a board that contains 4 consecutive pieces diagonally from bottom right to top left by the same player' do  
      it 'returns true' do
        
      end
    end

    context 'when given a board that does not contain 4 consecutive pieces from either player.' do
      it 'returns fals' do

      end
    end

  end

  describe '#full?' do
    context 'when given a board that is full' do
      it 'returns true'
    end
    context 'when given a board that still has space' do
      it 'returns false'
    end
  end

  describe '#load_game' do
    # Public method to load a saved game.
    context 'when give a save file where player 1 made the last move' do
      it 'starts up the gameloop with player 2' do
      end
    end


end