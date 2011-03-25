require './lib/bovespa'

bovespa = Bovespa.new
now = Time.now
and_then = now

while true
  now = Time.now

  if (now - and_then) > 5
    vale = bovespa.quote_for("VALE5")
    petr = bovespa.quote_for("PETR4")
    ogx  = bovespa.quote_for("OGXP3")

    puts vale
    puts petr
    puts ogx

    and_then = now
  end

  sleep 1
end

