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

    it 'should complete journey if touched in and out' do
      card = Oystercard.new
      card.topup(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(subject.complete?).to eq true
    end

    it 'should charge a min fare if journey is complete' do

      card = Oystercard.new
      card.topup(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(subject.fare).to eq Oystercard::MINIMUM_FARE
    end

  end

end
