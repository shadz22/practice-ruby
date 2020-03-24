class Oystercard

  attr_reader :balance
  attr_accessor :in_journey

  MAXIMUM_BALANCE = 90
  MIN_CHARGE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail 'Maximum balance of #{MAXIMUM_BALANCE} exceeded' if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Not sufficient amount' if @balance < MIN_CHARGE
    @in_journey = true
    @in_journey
  end

  def touch_out
    @in_journey = false
    @in_journey
  end

end
