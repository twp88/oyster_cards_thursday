require 'oystercard'

describe OysterCard do
  subject(:card) {described_class.new}

  it 'adds top-up to balance'do
    card.top_up(40)
    expect(card.balance).to eq 40
  end

end
