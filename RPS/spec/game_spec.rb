require 'game'

describe Game do
  subject(:game) { described_class.new(options) }
  let(:options) { { 'player_name' => 'Shadi', 'player_shape' => :rock, 'computer_shape' => :scissors } }

  describe '#player_name' do
    it 'returns the player name' do
      expect(game.player_name).to eq 'Shadi'
    end
  end

  describe '#player_shape' do
    it 'returns the player shape' do
      expect(game.player_shape).to eq :rock
    end
  end

  describe '#computer_shape' do
    it 'returns the shape computer has chosen' do
      expect(game.computer_shape).to eq :scissors
    end
  end

  context 'end game' do
    describe '#win?' do
      it 'returns true if player chooses :rock and computer chooses :scissors' do
        expect(game.win?).to eq true
      end
    end
  end

end