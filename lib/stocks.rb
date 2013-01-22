unless $LOAD_PATH.include?( File.dirname(__FILE__) )
  $LOAD_PATH.unshift File.dirname(__FILE__)
end

# project_root = File.dirname(File.absolute_path(__FILE__))
# Dir.glob(project_root + '/lib/stocks/*.rb').each {|file| load file}

#Dir["#{File.dirname(__FILE__)}../lib/**/*.rb"].each { |file| puts file }

load 'stocks/stock.rb'
load 'stocks/day.rb'
load 'stocks/yahoo_api.rb'
load 'stocks/request.rb'
load 'stocks/account.rb'
load 'stocks/transaction.rb'
load 'stocks/script.rb'
