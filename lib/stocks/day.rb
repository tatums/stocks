class Day
  require 'date'

  attr_reader :date, :open, :close, :high, :low, :volume

  def initialize(data)
    @date = Date.parse data[0]
    map_to(data[1])
  end

  private

  def map_to(args)
    args.each {|key,value| instance_variable_set("@#{key}", value.to_f) unless value.nil? }
  end

end
