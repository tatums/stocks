class Request
  attr_reader :stock, :api

  def initialize
    @stock = Stock.new('APPL')
    @api = Api.new
    @account = Account.new(5000.00)
    setup_data
  end


  private

  def setup_data
    @api.json_data.each { |item| @stock.add Day.new(item) }
  end

end