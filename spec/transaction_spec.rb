require 'spec_helper'

describe Transaction do

  before do
     @account = Account.new(500)
     @stock = Stock.new(name: 'Apple', symbol: 'AAPL' )
     @transaction = Transaction.new( account: @account, stock: @stock)
   end

  it 'Should be instantiated' do
    @transaction.should be_an_instance_of Transaction
  end

  # it 'Should have a balance of 500' do
  #   @account.balance.should ==  500
  # end

  # it 'Should add to balance' do
  #   @account.add_to_balance 100.25
  #   @account.balance.should ==  600.25
  # end

  # it 'Should deduct from balance' do
  #   @account.deduct_from_balance 100.25
  #   @account.balance.should ==  399.75
  # end

end