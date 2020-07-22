# frozen_string_literal: true

require_relative 'oystercard'

class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
