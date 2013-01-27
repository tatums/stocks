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

end