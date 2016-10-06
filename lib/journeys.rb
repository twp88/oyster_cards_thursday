class Journeys
  attr_reader :counter, :completed_journeys, :entry_station, :exit_station

  def initialize
    @counter = 0
    @completed_journeys = {}
    @entry_station = nil
    @exit_station = nil
  end

  def save_journeys
    @counter += 1
    @completed_journeys["Journey #{@counter}"] = [@entry_station, @exit_station]
  end

  def enter_station(station)
    @entry_station = station
  end

  def leave_station(station)
    @exit_station = station
  end

  def fare
    if @entry_station.zone > @exit_station.zone
      @entry_station.zone - @exit_station.zone
    else
      @exit_station.zone - @entry_station.zone
    end
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

end
