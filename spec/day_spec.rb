require 'spec_helper'

describe Day do
  #attr_reader :date, :open, :close, :high, :low, :volume

  before do
     @day = Day.new(  :date => Date.new(2012,1,1),
                      :open => 365.0,
                      :close => 525.0,
                      :high => 525.0,
                      :low => 325.0,
                      :volume => 12345.0 )
   end

  it 'Should be instantiated' do
    @day.should be_an_instance_of Day
  end

  it 'Should repond to open' do
    @day.open.should == 365.0
  end

  it 'Should repond to close' do
    @day.close.should == 525.0
  end

  it 'Should repond to high' do
    @day.high.should == 525.0
  end

  it 'Should repond to low' do
    @day.low.should == 325.0
  end

  it 'Should repond to volume' do
    @day.volume.should == 12345.0
  end

  it 'Should repond to gain?' do
    @day.gain?.should == true
  end

  it 'Should repond to loss?' do
    @day.loss?.should == false
  end

end