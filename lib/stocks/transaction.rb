class Transaction

  attr_reader :account, :stock

  def initialize(args = {})
    @stock = args[:stock]
    @account = args[:account]
  end

  def buy(args = {})
    @stock.buy(@account.balance, args[:unit_price])
    @account.buy(@stock)
    @account.deduct_from_balance( @account.balance )
  end

  def sell(args = {})
    @account.add_to_balance( @stock.value( args[:unit_price] ) )
    @account.sell( @stock )
  end

end