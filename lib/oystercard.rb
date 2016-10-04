class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MIN_FARE = 1

attr_reader :balance, :max_limit

  def initialize(max_limit = MAX_LIMIT, balance = BALANCE)
    @max_limit = max_limit
    @balance = balance
    @in_use = false
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > 90
    @balance += value
  end

  def touch_in
    raise "do not have enough money" if @balance < MIN_FARE
    raise "need to touch out first" if @in_use == true
    @in_use = true
  end

  def touch_out
    raise "need to touch in first" if @in_use == false
    @in_use = false
    deduct(MIN_FARE)
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(value)
    raise "can't deduct less than balance" if @balance < value
    @balance -= value
  end

end
