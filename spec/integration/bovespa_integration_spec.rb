describe Bovespa::Engine do
  before :each do
    @bovespa = Bovespa::Engine.new
  end

  it "goes out on the net and gets a Quote for VALE5" do
    quote = @bovespa.quote_for("VALE5")

    quote.should_not be_nil
    quote.stock.should == "VALE5"
  end

  it "raises InvalidStockError when passed an inexistent stock name" do
    lambda {
      @bovespa.quote_for "CACA4"
    }.should raise_exception(Bovespa::InvalidStockError)
  end
end

describe Bovespa do
  it "uses a simpler to go on the net and get a Quote for PETR4" do
    quote   = Bovespa.quote_for("PETR4")

    quote.should_not be_nil
    quote.stock.should == "PETR4"
  end
end
