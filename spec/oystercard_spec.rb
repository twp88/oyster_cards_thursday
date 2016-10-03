require 'oystercard'

describe OysterCard do
  subject(:card) {described_class.new}

  it 'adds top-up to balance' do
    card.top_up(0)
    expect(card.balance).to eq 0
  end

  it 'raises an error if balance is more than 90' do
    card.top_up(90)
    expect {card.top_up(5)}.to raise_error "balance cannot exceed 90 pounds"
  end
end
