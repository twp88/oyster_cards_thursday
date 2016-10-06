class Journey
attr_reader :counter, :completed_journeys, :journey_array
  def initialize
    @counter = 0
    @completed_journeys = {}
    @journey_array = []
  end

  def save_journeys(journey_array)
    @counter += 1
    @completed_journeys["Journey #{@counter}"] = @journey_array
  end

  

end
