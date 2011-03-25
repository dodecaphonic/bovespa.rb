require 'spec_helper'

describe QuoteParser do
  before :each do
    @parser = QuoteParser.new
    @data   = File.open(File.join(File.dirname(__FILE__), 'vale5.html'))
  end

  it "receives a bunch of text and returns a Quote object" do
    @parser.parse(@data).class.should == Quote
  end

  it "should return a Quote object for VALE5 with a specific value" do
    quote = @parser.parse(@data)

    quote.stock.should == "VALE5"
    quote.price.should == 47.07
    quote.oscilation.should == "0,36%"
    quote.volume.should == 11_030
  end
end
