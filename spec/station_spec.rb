require 'station'
require 'oystercard'

describe Station do
  subject(:station) { described_class.new }
  let(:card) { double :card }

  describe '#touch_in' do
    context 'when given a card' do
      it 'calls in journey on the card' do
        expect(card).to receive(:in_journey?)
        station.touch_in(card)
      end
    end
  end
end
