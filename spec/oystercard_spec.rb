require 'oystercard'
require 'station'

describe OysterCard do
  subject(:card) {described_class.new}

  before :each do
    @station = Station.new
  end

  describe "#top_up" do
    context "when top_up is given a value" do
      it 'adds top-up to balance' do
        card.top_up(0)
        expect(card.balance).to eq 0
      end
    end

    context "when given a balance more than 90" do
      it 'raises an error' do
        card.top_up(90)
        expect {card.top_up(5)}.to raise_error "balance cannot exceed #{OysterCard::MAX_LIMIT} pounds"
      end
    end
  end

  describe "#deduct" do
    context "when given a value to deduct" do
      it 'deducts value from the balance' do
        expect(card).to respond_to(:deduct)
        expect {card.deduct(1)}.to raise_error "do not have enough money"
      end
    end
  end

  describe "#in_use" do
    context "when card is touched in" do
      it "@in_use is set to true" do
        @station.touch_in(card)
        expect(card.in_use).to eq true
      end
    end

    context "when card is touched out" do
      it "when touched out, @in_use is set to false" do
        @station.touch_out(card)
        expect(card.in_use).to eq false
      end
    end
  end

end
