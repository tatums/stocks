class Script
  Trans = Struct.new(:type, :date)
  attr_reader :account, :stock

  def initialize
    #@stock = Stock.new(:symbol => 'AAPL', :name => 'Apple Inc.')
    #@stock = Stock.new(:symbol => 'FB', :name => '')
    #@stock = Stock.new(:symbol => 'DELL', :name => '')
    @stock = Stock.new(:symbol => 'MSFT', :name => '')
    #@stock = Stock.new(:symbol => 'GE', :name => '')
    #@stock = Stock.new(:symbol => 'INTC', :name => '')

    @account = Account.new(5000.00)

  end

  def run
    history = @stock.history(Date.new(2011,1,1), Date.today.prev_day).reverse
    items = find_days(history)
    execute(items)
  end

  private

  def execute(items)
    items.each do |item|
      buy_or_sell(item)
    end
  end

  def buy_or_sell(item)
    if item.type == :sell
      sell(item)
    else
      buy(item)
    end
  end

  def sell(item)
    unless @account.stocks.empty? or item.date.nil?
      Transaction.new(stock: @stock, account: @account).sell(unit_price: item.date[:open])
    end
  end

  def buy(item)
    if @account.balance > 0 and item.date
      Transaction.new(stock: @stock, account: @account).buy(unit_price: item.date[:open])
    end
  end

  def find_days(history, days = [])
    history.each_with_index do |item, index|
      first = history[index]
      second = history[index+1]
      third = history[index+2]
      if first and second and third


        # days << Trans.new(:buy, history[index+2]) if (first[:open] < first[:close]) and (second[:open] < second[:close])
        # days << Trans.new(:sell, history[index+2]) if (first[:open] > first[:close]) and (second[:open] > second[:close]

        days << Trans.new(:sell, history[index+3]) if (first[:open] < first[:close]) and (second[:open] < second[:close]) and (third[:open] > third[:close] )
        days << Trans.new(:buy, history[index+3]) if (first[:open] > first[:close]) and (second[:open] > second[:close]) and (third[:open] < third[:close] )

      end
    end
    days
  end

end