module Yahoofx
  class Converter
    def initialize(rate_class = Yahoofx::Pair)
      @rate_class = rate_class
    end

    def convert(input_string)
      parsed = parse(input_string)
      @rate_class.new(parsed[:from_currency], parsed[:to_currency]).bid*parsed[:from_amount]
    end

    def parse(input_string) 
      arr = input_string.split(/[\p{Space}]+/)
      { :from_amount => arr[0].to_f,
        :from_currency => arr[1],
        :to_currency => arr[3] }
    end
  end
end
