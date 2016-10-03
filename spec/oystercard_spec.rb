require 'oystercard'

describe OysterCard do
  subject(:card) {described_class.new}

  it 'takes a balance'do
  expect(card).to respond_to(:balance)
  end

end
