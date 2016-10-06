require 'journey.rb'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  describe "#saved-journeys" do

    context "when called" do
      it 'saves both stations to the completed_journeys hash' do
            journey.save_journeys([entry_station, exit_station])
            expect(journey.completed_journeys["Journey #{journey.counter}"]).to eq journey.journey_array
          end
        end
      end
end
