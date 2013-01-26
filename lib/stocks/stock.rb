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

  def history(start_date, end_date)
    YahooApi.new(self).history(start_date, end_date)
  end

  private

  def current_value
    YahooApi.new(self).value if shares
  end

  def current_price
    YahooApi.new(self).price
  end

end