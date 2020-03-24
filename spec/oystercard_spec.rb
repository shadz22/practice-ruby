require './lib/oystercard.rb'

describe Oystercard do
  it 'has a default balance of 0' do
    expect(subject.balance).to eq (0)
  end

  it 'is not initially in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
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

  describe '#deduct' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts the amount form the balance' do
      subject.top_up(30)
      expect{ subject.deduct(5)}.to change{ subject.balance }.by -5
    end
  end
end