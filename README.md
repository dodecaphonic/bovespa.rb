# bovespa.rb

This very creatively named library scrapes data from BM&F Bovespa's site and spits out quotes for any of the valid stocks therein available.

Idea pitched by the people to whom I've given a very nice TDD class   -- my coworkers. *sob*

## Using it

You've stopped suffering for my misfortune and now you want to check on stock and make some money. Great! So here's what you do:

    bovespa = Bovespa::Engine.new
    richie  = bovespa.quote_for("VALE5")
    rich    = bovespa.quote_for("PETR4")

Or if you'd rather just take a quick look at the thing:

    quote   = Bovespa.quote_for("VALE5")

and be done with it.

And voilà. Now, please, suffer a little more in sympathy. Thanks a bunch.