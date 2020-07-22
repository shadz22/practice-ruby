# frozen_string_literal: true

require './lib/station.rb'

describe Station do
  let(:name) { 'Old Street' }
  let(:zone) { 1 }
  let(:subject) { Station.new(name, zone) }

  it 'has a name' do
    expect(subject.name).to eq('Old Street')
  end

  it 'has a zone' do
    expect(subject.zone).to eq(1)
  end
end
