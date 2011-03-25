describe Bovespa::Engine do
  before :each do
    @bovespa = Bovespa::Engine.new
  end

  it "receives a stock name and returns a Quote object" do
    data    = File.open(Bovespa::Test::Fixtures['vale5'])

    Net::HTTP.should_receive(:get).
      with(URI.parse(Bovespa::Engine::BASE_URL % ["VALE5"])).
      and_return data

    quote = @bovespa.quote_for("VALE5")

    quote.should_not be_nil
    quote.stock.should == "VALE5"
    quote.price.should == 47.07
  end

  it "raises InvalidStockError when passed an inexistent stock name" do
    data = File.open(Bovespa::Test::Fixtures['invalid'])

    Net::HTTP.should_receive(:get).
      with(URI.parse(Bovespa::Engine::BASE_URL % ["CACA3"])).
      and_return data

    lambda {
      @bovespa.quote_for("CACA3")
    }.should raise_exception(Bovespa::InvalidStockError)
  end
end
