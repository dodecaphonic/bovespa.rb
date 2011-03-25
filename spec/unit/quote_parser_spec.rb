require 'spec_helper'

describe Bovespa::QuoteParser do
  it "should return a Quote object for VALE5 with a specific value" do
    parser = Bovespa::QuoteParser.new
    data   = File.open(File.join(File.dirname(__FILE__), 'vale5.html'))

    quote = parser.parse(data)

    quote.stock.should == "VALE5"
    quote.price.should == 47.07
    quote.oscilation.should == "0,36%"
    quote.volume.should == 11_030
  end
end
