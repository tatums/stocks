class Stock

  attr_reader :name, :days, :symbol, :shares

  def initialize(args = {})
    @symbol = args[:symbol]
    @name = args[:name]
    @shares = args[:shares]
  end

  def buy(dollar_amount, unit_price=current_price)
    @shares = ( dollar_amount / unit_price.to_f ).round(3)
  end

  def value(unit_price=current_price)
    (unit_price.to_f* @shares).round(3) if @shares
  end

  def history_to_date
    history.map{ |d| Day.new( :date => Date.parse( d[:date] ) ,
                              :open => d[:open].to_f,
                              :close => d[:close].to_f,
                              :high => d[:high].to_f,
                              :low => d[:low].to_f,
                              :volume => d[:volume].to_f,
                              :adj_close => d[:adj_close].to_f
                ) }
  end

  def history(start_date=default_start, end_date=default_end)
    YahooApi.new(self).history(start_date, end_date)
  end

  private


  def default_start
    Date.today.prev_day
  end

  def default_end
    Date.today.prev_day
  end

  def current_value
    YahooApi.new(self).value if shares
  end

  def current_price
    YahooApi.new(self).price
  end

end