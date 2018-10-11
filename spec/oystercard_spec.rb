require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { { "Start:" => entry_station, "End:" => exit_station} }

  context 'initialization' do

    it 'should have an initial balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'should initially not be in journey' do
      expect(subject.entry_station).to eq nil
    end

    it 'raises an error if insufficient balance and is touched in' do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance"
    end

    it 'should have an empty list of journeys' do
      expect(subject.journeys).to eq []
    end

  end

  context 'when topped up' do

    it 'should have money on it' do
      subject.topup(10)
      expect(subject.balance).to eq 10
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.topup(maximum_balance)
      expect{ subject.topup 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

  end

  context 'when topped up and touched in' do

    before(:each) do
      subject.topup(10)
      subject.touch_in(entry_station)
    end

      it 'should be able to be touched in' do
        expect(subject.entry_station).to eq entry_station
      end

      it 'should be able to be touched out' do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq nil
      end

      it 'deducts the minimum fare from the balance' do
        minimum_fare = Oystercard::MINIMUM_FARE
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-minimum_fare)
      end

      it 'should remember the entry station' do
        expect(subject.entry_station).to eq entry_station
      end

      it 'should forget the entry station once touched out' do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq nil
      end

      it 'should store a list of journeys' do
        subject.touch_out(exit_station)
        expect(subject.journeys).to include journey
      end

  end

end
