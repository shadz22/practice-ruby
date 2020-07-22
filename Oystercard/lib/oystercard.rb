class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  # attr_accessor :in_journey

  MAXIMUM_BALANCE = 90
  MIN_CHARGE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail 'Maximum balance of #{MAXIMUM_BALANCE} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end
  
  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail 'Not sufficient amount' if @balance < MIN_CHARGE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @exit_station = exit_station
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  
end
