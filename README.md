# Yahoofx

## Foreign exchange (forex) rate scraper

Gets real time foreign currency exchange rates from Yahoo Finance.

Includes shell command that returns the rate. Usage: yahoofx
[currency pair]

E.g. `yahoofx eurusd` outputs 1.2925 if the price of 1 EUR is 1.2925 USD

To use this in your ruby code, this would return the rate as a Float: `Yahoofx::Pair.new(:eur, :usd).bid`
