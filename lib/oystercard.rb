class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MIN_FARE = 1

attr_reader :balance, :max_limit, :entry_station, :exit_station, :completed_journeys, :counter

  def initialize(max_limit = MAX_LIMIT, balance = BALANCE)
    @max_limit = max_limit
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @completed_journeys = {}
    @counter = 0
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > 90
    @balance += value
  end

  def touch_in(station)
    raise "do not have enough money" if @balance < MIN_FARE
    raise "need to touch out first" if @entry_station != nil
    @entry_station = station
  end

  def touch_out(station)
    raise "need to touch in first" if @entry_station == nil
    @exit_station = station
    save_journeys
    @entry_station = nil
    deduct(MIN_FARE)
  end

  def in_journey?
    return true if @entry_station != nil
    false
  end

  def save_journeys
    @counter += 1
    @completed_journeys["Journey #{@counter}"] = [@entry_station, @exit_station]
  end

  private

  def deduct(value)
    raise "can't deduct less than balance" if @balance < value
    @balance -= value
  end

end
