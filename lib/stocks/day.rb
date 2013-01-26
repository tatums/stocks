class Day
  require 'date'

  attr_reader :date, :open, :close, :high, :low, :volume

  def initialize(args={})
    args.each {|key,value| instance_variable_set("@#{key}", value) unless value.nil? }
  end

  def gain?
    close > open
  end

  def loss?
    close < open
  end

  def result
    'Gain or Loss'
  end

end
