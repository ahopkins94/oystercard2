require 'station'

describe Station do

  it 'should expose the name' do
    subject = Station.new("station", 1)
    expect(subject.name).to eq "station"
  end

  it 'should expose the zone' do
    subject = Station.new("station", 1)
    expect(subject.zone).to eq 1
  end

end
