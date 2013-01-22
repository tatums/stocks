class Script
  Trans = Struct.new(:type, :date)
  attr_reader :account

  def initialize
    @stock = Stock.new(:symbol => 'AAPL', :name => 'Apple Inc.')
    @account = Account.new(4234.12)
  end

  def run
    history = @stock.history(Date.new(2012,11,1), Date.new(2012,12,31)).reverse
    items = find_days(history)
    execute(items)
  end

  private

  def execute(items)
    items.each { |item|  puts @account.balance ; buy_or_sell(item) }
  end

  def buy_or_sell(item)
    if item.type == :sell
      buy(item)
    else
      sell(item)
    end
  end

  def buy(item)
    Transaction.new(stock: @stock, account: @account).buy(unit_price: item.date[:open])
  end

  def sell(item)
    Transaction.new(stock: @stock, account: @account).sell(unit_price: item.date[:close])
  end

  def find_days(history, days = [])
    history.each_with_index do |item, index|
      first = history[index]
      second = history[index+1]
      if first and second
        days << Trans.new(:buy, history[index+2]) if (first[:open] < first[:close]) and (second[:open] < second[:close])
        days << Trans.new(:sell, history[index+2]) if (first[:open] > first[:close]) and (second[:open] > second[:close])
      end
    end
    days
  end

end