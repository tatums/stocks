class YahooApi

  require 'yahoo_stock'

  def initialize(stock)
    @stock = stock
    @api = YahooStock::Quote.new(:stock_symbols => [@stock.symbol])
  end

  def history(start_date, end_date)
    history = api_history(start_date, end_date)
    history.results(:to_hash).output.map{ |d| datify(d) }
  end

  def price
    current[:last_trade_price_only].to_f
  end

  def value
    @stock.shares * current[:last_trade_price_only].to_f
  end

  private

  def api_history(start_date, end_date)
    YahooStock::History.new(:stock_symbol => @stock.symbol, :start_date => start_date, :end_date => end_date)
  end

  def datify(d)
    Day.new(    :date => Date.parse( d[:date] ) ,
                :open => d[:open].to_f,
                :close => d[:close].to_f,
                :high => d[:high].to_f,
                :low => d[:low].to_f,
                :volume => d[:volume].to_f,
                :adj_close => d[:adj_close].to_f )
  end

  def current
    @api.results(:to_hash).output.first
  end

end




#require 'yahoo_stock'
  #history = YahooStock::History.new(:stock_symbol => 'appl', :start_date => Date.today-120, :end_date => Date.today-2)
  #history.results(:to_hash).output
