require 'journeys.rb'
require 'oystercard.rb'

describe Journeys do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}
  #let(:card) {OysterCard.new}

  describe "#saved-journeys" do

    context "when called" do
      it 'saves both stations to the completed_journeys hash' do
            card = OysterCard.new
            card.top_up(10)
            card.touch_in(entry_station)
            card.touch_out(exit_station)
            expect(card.journey.completed_journeys["Journey #{card.journey.counter}"]).to eq [entry_station, exit_station]
          end
        end
      end

    describe "#in_journey"do
      context "when called" do
        it 'checks that card is in journey' do
          journey.enter_station(entry_station)
          expect(journey.in_journey?).to be true
        end
      end
    end
end
