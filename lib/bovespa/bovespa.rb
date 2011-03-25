require 'net/http'

class Bovespa
  BASE_URL = "http://www.bmfbovespa.com.br/Cotacao-Rapida/ExecutaAcaoCotRapXSL.asp?gstrCA=&txtCodigo=%s&intIdiomaXsl=0"

  def quote_for(stock_name)
    raw_data = Net::HTTP.get(URI.parse(BASE_URL % [stock_name]))

    parser = QuoteParser.new
    parser.parse raw_data
  end
end

