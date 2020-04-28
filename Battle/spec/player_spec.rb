# require 'spec_helper'
require 'player'

describe Player do

  subject(:shadi) { Player.new('Shadi') }
  subject(:james) { Player.new('James') }
  
  describe '#name' do
    it 'returns its name' do
      expect(shadi.name).to eq 'Shadi'
    end
  end

  describe '#hit_points' do
    it 'return the hit points' do
      expect(shadi.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive_damage' do
    it 'deducts 10 hit points' do
      expect { shadi.receive_damage }.to change {shadi.hit_points}.by(-10)
    end
  end


end