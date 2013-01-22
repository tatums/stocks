class Account
  attr_reader :balance, :stocks

  def initialize(balance)
    @balance = balance.to_f
    @stocks = []
  end

  def buy(stock)
    @stocks << stock
  end

  def sell(stock)
    @stocks.delete stock
  end

  def add_to_balance(amount)
    @balance += amount.to_f
  end

  def deduct_from_balance(amount)
    @balance -= amount.to_f
  end

end