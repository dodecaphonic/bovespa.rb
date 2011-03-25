require 'spec_helper'

describe Bovespa::QuoteParser do
  before :each do
    @parser = Bovespa::QuoteParser.new
  end

  it "returns a Quote object for VALE5 with a specific value" do
    data  = File.open(Bovespa::Test::Fixtures['vale5'])
    quote = @parser.parse(data)

    quote.stock.should == "VALE5"
    quote.price.should == 47.07
    quote.oscilation.should == "0,36%"
    quote.volume.should == 11_030
  end

  it "raises InvalidStockError data for an inexistent stock is passed " do
    data = File.open(Bovespa::Test::Fixtures['invalid'])

    lambda {
      @parser.parse data
    }.should raise_exception(Bovespa::InvalidStockError)
  end
end
