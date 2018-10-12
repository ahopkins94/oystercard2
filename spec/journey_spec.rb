require 'journey'

describe Journey do
  let(:entry_station) { double :station }
  it 'initializes journey when touch in' do
    subject.touch_in(entry_station)
    expect(subject.in_journey).to eq true
  end
end
