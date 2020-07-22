require 'journey'

describe Journey do

  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

it{ is_expected.to respond_to(:start_journey).with(1).argument }

it{ is_expected.to respond_to(:end_journey).with(1).argument }
  
  describe '#start_journey' do
    it 'stores entry station' do
      
end