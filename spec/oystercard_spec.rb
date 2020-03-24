require './lib/oystercard.rb'

describe Oystercard do

  let(:station){ double :station }

  it 'has a default balance of 0' do
    expect(subject.balance).to eq (0)
  end

  it 'is not initially in a journey' do
    expect(subject).not_to be_in_journey
  end

  context 'touching in and out' do
    before(:each) do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
    end

    it 'is in journey after touch in' do
      expect(subject).to be_in_journey
    end

    it 'is not in journey after touch out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts the journey fare from the balance after touching out' do
      expect{ subject.touch_out }.to change{ subject.balance }.by(- Oystercard::MIN_CHARGE)
    end

    it 'stores the entry station' do
      # subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
end

  it 'throws an error if there is not sufficient money in the card when touch in' do
    expect{ subject.touch_in(station) }.to raise_error 'Not sufficient amount'
  end

  describe '#top_up' do
    it 'top ups the balance by the top-up amount' do
      subject.top_up(20)
      expect(subject.balance).to eq(20)
    end

    it 'tops ups' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it 'throws an error if maximum balance is reached' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up(1)}.to raise_error 'Maximum balance of #{MAXIMUM_BALANCE} exceeded'
    end
  end
end