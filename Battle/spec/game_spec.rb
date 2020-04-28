require 'game'

describe Game do
  subject(:game) { Game.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#player_1' do
    it 'retrieves player 1' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves player 2' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#current_turn' do
    it 'player 1 starts the game' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turn' do
    it 'switches the player\'s turn' do
      expect(game.switch_turn).to eq player_2
    end
  end

  describe '#opponent_of' do
    it 'determines the opponent of the current player' do
      expect(game.opponent_of(player_1)).to eq player_2
      expect(game.opponent_of(player_2)).to eq player_1
    end
  end
  
end