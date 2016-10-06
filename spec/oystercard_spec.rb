require 'oystercard'


describe OysterCard do
  subject(:card) { described_class.new }
  let(:card_topped_up) { described_class.new(90, 1) }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

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
        card_topped_up.touch_in(entry_station)
        expect(card_topped_up.in_journey?).to be true
      end
    end

    context "when balance is less than fare" do
      it "raises an error" do
        expect{card.touch_in(entry_station)}.to raise_error "do not have enough money"
      end
    end

    context 'when already touched in' do
      it "raises an error" do
        card_topped_up.touch_in(entry_station)
        expect{ card_topped_up.touch_in(entry_station) }.to raise_error "need to touch out first"
      end
    end

    context "check entry station is saved" do
      it "station is saved" do
        card_topped_up.touch_in(entry_station)
        expect(card_topped_up.entry_station).not_to be nil
      end
    end
  end

  describe "#touch_out" do
    context "when card touches out" do
      before :each do
        card_topped_up.touch_in(entry_station)
        card_topped_up.touch_out(exit_station)
      end

      it "sets in_journey to false" do
        expect(card_topped_up.entry_station).to be nil
      end

      it "exit station is not nil" do
        expect(card_topped_up.exit_station).not_to be nil
      end

      it "saves the exit station" do
        expect(card_topped_up.exit_station).to be exit_station
      end
    end

      context 'when already touched out' do
        it "raises an error" do
          expect{ card.touch_out(exit_station) }.to raise_error "need to touch in first"
        end


      it "deducts the minimum fare from the balance" do
        card_topped_up.touch_in(entry_station)
        expect {card_topped_up.touch_out(exit_station)}.to change{card_topped_up.balance}.by(-(OysterCard::MIN_FARE))
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

  describe "#save_journeys" do
    context "checks that hash" do
      it "is empty when card is initialized" do
        expect(card_topped_up.completed_journeys).to be {}
      end
    end

    context "when called" do
      before :each do
        card_topped_up.touch_in(entry_station)
        card_topped_up.touch_out(exit_station)
      end
      
      it "checks that new hash isn't empty" do
        expect(card_topped_up.completed_journeys).not_to be nil
      end

      it "saves both stations to the hash" do
        expect(card_topped_up.completed_journeys["Journey #{card_topped_up.counter}"]).to eq [entry_station, exit_station]
      end

    end
  end
end
