class Journeys
  attr_reader :counter, :completed_journeys, :entry_station, :exit_station

  def initialize
    @counter = 0
    @completed_journeys = {}
    @entry_station = nil
    @exit_station = nil
  end

  def save_journeys(station_array)
    @counter += 1
    @completed_journeys["Journey #{@counter}"] = station_array
  end

  def enter_station(station)
    @entry_station = station
  end

  def leave_station(station)
    @exit_station = station
  end
end
