class Day
  require 'date'

  attr_reader :date, :open, :close, :high, :low, :volume

  def initialize(data={})
    map_to(data)
  end

  def result
    'Gain or Loss'
  end

  private

  def map_to(args)
    args.each {|key,value| instance_variable_set("@#{key}", value) unless value.nil? }
  end

end
