require 'nokogiri'

class Quote
  attr_accessor :stock, :price, :oscilation, :volume

  def initialize(stock, price, oscilation, volume)
    @stock = stock
    @price = price
    @oscilation = oscilation
    @volume = volume
  end

  def to_s
    "#{@stock} - #{@price}, #{@oscilation}"
  end
end

class QuoteParser
  def parse(raw_data)
    doc = Nokogiri::HTML(raw_data)

    table = doc.search("#tbCotacoesInfo")
    stock = table.search("th.tdValor").shift.content.sub(/^#/, '')

    price, oscilation, volume = table.search("td.tdValor").map { |td|
      td.content.strip
    }

    price  = price.scan(/\d+/).join(".").to_f
    volume = volume.sub('.', '').to_i

    Quote.new stock, price, oscilation, volume
  end
end
