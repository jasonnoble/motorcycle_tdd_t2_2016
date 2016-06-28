require './lib/motorcycle'

describe Motorcycle do
  let(:motorcycle) { Motorcycle.new }

  it 'should be a Motorcycle' do
    expect(motorcycle).to be_a(Motorcycle)
  end

  describe '#initialize' do
    it 'has no fuel' do
      expect(motorcycle.fuel).to eq(0)
    end
    it 'has zero miles' do
      expect(motorcycle.miles).to eq(0)
    end
  end

  describe '#filler_up' do
    it 'fills the gas tank' do
      expect do
        motorcycle.filler_up
      end.to change(motorcycle, :fuel).from(0).to(100)
    end
  end

  describe '#drive(speed, speed_limit)' do
    before(:each) do
      motorcycle.filler_up
      motorcycle.drive(35, 35)
    end

    it 'sets the speed limit' do
      expect(motorcycle.speed_limit).to eq(35)
    end

    it 'sets the current speed' do
      expect(motorcycle.speed).to eq(35)
    end

    it 'dropes the fuel level by 10' do
      expect { motorcycle.drive(40, 35) }.to change(motorcycle, :fuel).by(-10)
    end

    it 'warns you when fuel is low' do
      7.times { motorcycle.drive(45, 35) }
      expect do
        motorcycle.drive(40, 35)
      end.to output(/We're on vapor Cougar!/).to_stderr
    end
  end

  describe '#stop' do
    it 'sets the current speed to zero' do
      motorcycle.stop
      expect(motorcycle.speed).to eq(0)
    end
  end
end
