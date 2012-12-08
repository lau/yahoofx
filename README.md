# Yahoofx

## Foreign exchange (forex) rate scraper

Gets foreign currency exchange rates from Yahoo Finance.

### Installation

Simply the gem: `gem install yahoofx` 

### Usage

Includes shell command that returns the rate. Usage: yahoofx
[currency pair]

E.g. `yahoofx eurusd` outputs 1.2925 if the price of 1 EUR is 1.2925 USD

To use this in your ruby code, this would return the rate as a Float: `Yahoofx::Pair.new(:eur, :usd).bid`

### License

The MIT License (MIT)

Copyright © 2012 Lau Taarnskov

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
