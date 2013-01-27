require 'spec_helper'

describe Stock do

  let(:stock) { Stock.new(name: 'Apple', symbol: 'AAPL' ) }

  it 'Should respond to :name' do
    stock.should respond_to :name
  end

  it 'Should respond to :symbol' do
    stock.should respond_to :symbol
  end

  it 'Should respond to history' do
    stock.history.should be_an_instance_of Array
  end

  # it 'history method should be an array of Days' do
  #   stock.history.map(&:class).include?(Day).should eq true
  # end

end
