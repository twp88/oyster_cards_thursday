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

    context 'when already touched in' do
      it "raises an error" do
        card.top_up(1)
        card.touch_in
        expect{ card.touch_in }.to raise_error "need to touch out first"
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

      context 'when already touched out' do
        it "raises an error" do
          card.top_up(1)
          expect{ card.touch_out }.to raise_error "need to touch in first"
        end
      end

      it "deducts the minimum fare from the balance" do
        card.top_up(1)
        card.touch_in
        expect {card.touch_out}.to change{card.balance}.by(-(OysterCard::MIN_FARE))
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
