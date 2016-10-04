require 'oystercard'


describe OysterCard do
  subject(:card) { described_class.new }
  let(:station) { double :station }

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
        expect {card.deduct(1)}.to raise_error "can't deduct less than balance"
      end
    end
  end

  describe "#touch_in" do
    context "when card touches in" do
      it "sets in_journey to true" do
        card.top_up(1)
        card.touch_in
        expect(card.in_journey?).to be true
      end
    end

    context "when balance is less than fare" do
      it "raises an error" do
        expect{card.touch_in}.to raise_error "do not have enough money"
      end
    end
  end

  describe "#touch_out" do
    context "when card touches out" do
      it "sets in_journey to false" do
        card.top_up(1)
        card.touch_in
        card.touch_out
        expect(card.in_journey?).to be false
      end
    end
  end

  describe "#in_journey?" do
    context "when card is initialized" do
      it "it is not in journey" do
        expect(card.in_journey?).to be false
      end
    end
  end

  end
