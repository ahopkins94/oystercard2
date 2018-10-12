require 'journey'
require 'oystercard'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  context 'initialize' do

  it 'should have no entry station when initialized' do
    expect(subject.entry_station).to eq nil
  end

  it 'should have no exit station when initialized' do
    expect(subject.exit_station).to eq nil
  end

  end

  context 'fare' do

  it 'should charge minimum fare for complete journey' do
    card = Oystercard.new
    card.topup(10)
    card.touch_in(entry_station)
    card.touch_out(exit_station)
    expect(subject.complete?).to eq true 
  end

  end

end
