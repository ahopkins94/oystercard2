class Journey

  attr_reader :entry_station, :exit_station

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
  end

end
