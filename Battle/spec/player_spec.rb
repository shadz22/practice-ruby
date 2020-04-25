# require 'spec_helper'
require 'player'

describe Player do

  subject(:shadi) { Player.new('Shadi') }
  
  describe '#name' do
    it 'returns its name' do
      expect(shadi.name).to eq 'Shadi'
    end
  end
end