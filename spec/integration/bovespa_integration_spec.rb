describe Bovespa::Engine do
  it "goes out on the net and gets a Quote for VALE5" do
    bovespa = Bovespa::Engine.new
    quote   = bovespa.quote_for("VALE5")

    quote.should_not be_nil
    quote.stock.should == "VALE5"
  end
end

describe Bovespa do
  it "uses a simpler to go on the net and get a Quote for PETR4" do
    quote   = Bovespa.quote_for("PETR4")

    quote.should_not be_nil
    quote.stock.should == "PETR4"
  end
end
