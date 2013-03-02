require 'sinatra'
require './lib/stocks.rb'


get '/' do
  @script = Script.new
  @pre_balance = @script.balance
  @script.run
  # @data_open = @script.data.each_with_index.map {|d,i| {:x => d[:date], :y => d[:open]} }.to_json
  # @data_close = @script.data.each_with_index.map {|d,i| {:x => d[:date], :y => d[:close]} }.to_json

  # @data_open = @script.data.map{|d|
  #     {:x => "new Date(#{d[:date].year},#{d[:date].month},#{d[:date].day})", :y => d[:open] }
  #         }.to_json

  # @data_open = @script.data.each_with_index.map {|d,i| {:x => i, :y => d[:open]} }.to_json
  # @data_close = @script.data.each_with_index.map {|d,i| {:x => i, :y => d[:close]} }.to_json

  @data = @script.data
  @post_balance = @script.balance


  erb :index
end