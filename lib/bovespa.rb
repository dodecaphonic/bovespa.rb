$: << File.dirname(__FILE__)

require 'bovespa/quote_parser'
require 'bovespa/bovespa'

module Bovespa
  def self.quote_for(stock_name)
    Bovespa::Engine.new.quote_for stock_name
  end
end
