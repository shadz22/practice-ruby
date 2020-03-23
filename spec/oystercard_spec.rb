require './lib/oystercard.rb'

describe Oystercard do
  it 'has a default balance of 0' do
    expect(subject.balance).to eq (0)
  end

  describe '#top_up' do
    it 'top ups the balance by the top-up amount' do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
    end

    it 'tops ups' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end
  end
    
end