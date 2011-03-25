describe Bovespa do
  it "receives a stock name and returns a Quote object" do
    data    = File.open(File.join(File.dirname(__FILE__), 'vale5.html'))
    bovespa = Bovespa.new

    Net::HTTP.should_receive(:get).
      with(URI.parse(Bovespa::BASE_URL % ["VALE5"])).
      and_return data

    quote   = bovespa.quote_for("VALE5")

    quote.should_not be_nil
    quote.stock.should == "VALE5"
    quote.price.should == 47.07
  end
end
