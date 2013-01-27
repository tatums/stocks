require 'spec_helper'

describe Day do

  let(:day) { Day.new(  :date => Date.new(2012,1,1),
                        :open => 365.0,
                        :close => 525.0,
                        :high => 525.0,
                        :low => 325.0,
                        :volume => 12345.0 ) }

  it 'Should repond to open' do
    day.should respond_to :open
  end

  it 'Should repond to close' do
    day.should respond_to :close
  end

  it 'Should repond to high' do
    day.should respond_to :high
  end

  it 'Should repond to low' do
    day.should respond_to :low
  end

  it 'Should repond to volume' do
    day.should respond_to :volume
  end

  it 'gain? should return true' do
    day.should be_gain
  end

  it 'loss? should return false' do
    day.should_not be_loss
  end

end