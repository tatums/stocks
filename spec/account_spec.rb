require 'spec_helper'

describe Account do

  let(:account) { Account.new(500) }
  let(:stock)  { Stock.new(name: 'Apple Inc.', symbol: 'AAPL') }


  it 'Should have a balance' do
    account.balance.should ==  500
  end

  it 'Should be able to add to balance' do
    account.add_to_balance 100.25
    account.balance.should ==  600.25
  end

  it 'Should be able to deduct from balance' do
    account.deduct_from_balance 100.25
    account.balance.should ==  399.75
  end

  it 'Should be able to add stocks to account' do
    account.buy stock
    account.stocks.size.should == 1
  end

  it 'Should be able to remove stocks to account' do
    account.buy @stock
    account.sell @stock
    account.stocks.size.should == 0
  end

end