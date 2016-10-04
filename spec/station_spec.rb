# require 'station'
# require 'oystercard'
#
# describe Station do
#   subject(:station) { described_class.new }
#
#   before :each do
#     @card = OysterCard.new
#   end

  # describe '#touch_in' do
  #   context 'when given a card' do
  #     it 'calls in journey on the card' do
  #       expect(@card).to receive(:in_journey?)
  #       station.touch_in(@card)
  #     end
  #   end

#     context "when given a card" do
#       it "card.in_use is equal to true" do
#         station.touch_in(@card)
#         expect(@card.in_use).to eq true
#       end
#     end
#   end
#
#   describe "#touch_out" do
#     context "when given a card" do
#       it "calls in journey on the card" do
#         expect(@card).to receive(:in_journey?)
#         station.touch_out(@card)
#       end
#     end
#   end
# end
