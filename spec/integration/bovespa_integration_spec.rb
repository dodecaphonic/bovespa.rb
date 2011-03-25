describe Bovespa do
  it "goes out on the net and gets a Quote for VALE5" do
    bovespa = Bovespa.new
    quote   = bovespa.quote_for("VALE5")

    quote.should_not be_nil
    quote.stock.should == "VALE5"
  end
end
