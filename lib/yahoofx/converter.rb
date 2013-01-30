module Yahoofx
  class Converter
    def initialize(rate_class = Yahoofx::Pair)
      @rate_class = rate_class
    end

    # Either returns a currency rate or converts an amount from one currency to another.
    # Example to convert currency: "119.99 EUR in USD"
    # Example to show currency rate: "EURUSD"
    def answer(p)
      if p.length==6
        return @rate_class.new(p[0..2], p[3..5]).bid
      else
        convert p
      end
    end

    def convert(input_string)
      parsed = parse(input_string)
      @rate_class.new(parsed[:from_currency], parsed[:to_currency]).bid*parsed[:from_amount]
    end

    # Example parameter: "100 EUR in USD"
    def parse(input_string)
      /([\d\.]+)[\p{Space}]*(.*)in(.*)/ =~ input_string
      { :from_amount => $1.to_f,
        :from_currency => $2.strip,
        :to_currency => $3.strip }
    end
  end
end
