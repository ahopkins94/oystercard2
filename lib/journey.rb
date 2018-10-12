class Journey

  MINIMUM_FARE = 1
  PENALTY = 6
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def complete?
    !(@entry_station = nil && @exit_station = nil)
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY
  end

end
