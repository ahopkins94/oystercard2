require 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def topup(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @journeys << { "Start:" => @entry_station, "End:" => @exit_station }
    @entry_station = nil
    @in_journey = false
  end

  def in_journey?
    @entry_station == station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
