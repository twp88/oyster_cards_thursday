require "station"

describe Station do

subject(:station) { described_class.new("test-name", "test-zone") }

  describe "#initialize" do
    context "when initialized with a name and a station" do
      it "stores name in a variable" do
        expect(station.name).to eq "test-name"
      end

      it "stores zone in a variable" do
        expect(station.zone).to eq "test-zone"
      end
    end
  end
end
