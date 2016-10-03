class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
attr_reader :balance, :max_limit

  def initialize(max_limit = MAX_LIMIT, balance = BALANCE)
    @max_limit = max_limit
    @balance = balance
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value >= 90
    @balance += value
  end

end
