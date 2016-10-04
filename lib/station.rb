require_relative "oystercard"

class Station

  def touch_in(card)
    card.in_journey?(true)
  end

  def touch_out(card)
    card.in_journey?(false)
  end
end
