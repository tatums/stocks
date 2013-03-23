class Script
  Trans = Struct.new(:type, :date)
  attr_reader :account, :stock, :history, :data

  def initialize
    @stock = Stock.new(:symbol => 'AAPL', :name => 'Apple Inc.')
    #@stock = Stock.new(:symbol => 'FB', :name => '')
    #@stock = Stock.new(:symbol => 'DELL', :name => 'Dell')
    #@stock = Stock.new(:symbol => 'MSFT', :name => '')
    #@stock = Stock.new(:symbol => 'GE', :name => '')
    #@stock = Stock.new(:symbol => 'INTC', :name => '')
    @account = Account.new(5000.00)
  end

  def run
    history = @stock.history(Date.new(2010,1,1), Date.today.prev_day).reverse
    @history = history.map {|d| {:date => d.date, :gain? => d.gain? } }
    @data = history.map {|d| {date: d.date, open: d.open, close: d.close } }
    days = find_days(history)
    find_buy_and_sell(days)
    puts balance
  end


  private

  def find_buy_and_sell(days)
    days.each { |day| buy_or_sell(day) }
  end

  def buy_or_sell(item)
    if item.type == :sell
      sell(item)
    else
      buy(item)
    end
  end

  def sell(item)
    Transaction.new(stock: @stock, account: @account).sell(unit_price: item.date.open) unless @account.stocks.empty? or item.date.nil?
  end

  def buy(item)
    Transaction.new(stock: @stock, account: @account).buy(unit_price: item.date.open) if @account.balance > 0 and item.date
  end


  def find_days(results, days = [])
    results.each_with_index do |item, index|
      test_case = mapped_results(results, index)
      case
      when test_case.map(&:gain?) == signature
        days << blah('sell', index, results, signature)
      when test_case.map(&:loss?) == signature
        days << blah('buy', index, results, signature)
      end
    end
    days
  end

  def blah(action, index, results, signature)
    Trans.new(action.to_sym, results[index+signature.size])
  end

  def mapped_results(results, index)
    results.slice(index..(index + signature.size-1) )
  end

  def signature
    [true, true, true, true, false]
  end

  def to_currency(number)
    decimal_place(number).gsub(/(\d)(?=\d{3}+(?:\.|$))(\d{3}\..*)?/,'\1,\2')
  end

  def decimal_place(number)
    '%.2f' % number
  end

  public

  def balance
    if account.stocks.empty?
      to_currency(account.balance)
    else
      to_currency(account.stocks.first.value)
    end
  end

end