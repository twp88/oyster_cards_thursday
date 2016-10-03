require 'oystercard'

describe OysterCard do
  subject(:card) {described_class.new}

  it 'takes a balance'do
  expect(card).to respond_to(:balance)
  end

  it 'can be topped up' do
    expect(card).to respond_to(:top_up).with(1).argument
  end

  it 'adds top-up to balance'do
    card.top_up(40)
    expect(card.balance).to eq 40
  end

end
