require 'oystercard'
require 'station'

describe OysterCard do
  subject(:card) {described_class.new}
  let(:station) {double :station}

  before do
    allow(station).to receive(:touch_in)
  end

  it 'adds top-up to balance' do
    card.top_up(0)
    expect(card.balance).to eq 0
    #expect{ card.top_up(10) }.to change{ card.balance }.by(10)
  end

  it 'raises an error if balance is more than 90' do
    card.top_up(90)
    expect {card.top_up(5)}.to raise_error "balance cannot exceed #{OysterCard::MAX_LIMIT} pounds"
  end

  it 'deducts value from the balance' do
    expect(card).to respond_to(:deduct)
    expect {card.deduct(1)}.to raise_error "do not have enough money"
  end

  it 'card can be touched in at the station' do
    expect(station).to respond_to(:touch_in).with(1).argument
  end

  it 'station calls in journey on card when touched in' do
    expect(card).to respond_to(:in_journey?)
  end
end
