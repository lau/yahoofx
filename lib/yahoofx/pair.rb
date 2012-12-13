require 'net/http'

module Yahoofx
  class Pair
    # First and second currency code. The parameters could be "USD" and "EUR" for instance
    def initialize(first, second)
      @first, @second = first.to_s, second.to_s
      raise "Invalid currency code provided" unless valid_currency_code?(@first) && 
                                                    valid_currency_code?(@second)  
    end

    def bid
      request_feed.scan(bid_regexp).each { |results| return results.first.to_f }
      nil
    end

    protected
      def valid_currency_code?(currency_code)
        return true if currency_code =~ /^[a-zA-Z]{3}$/
        false
      end

      def url_for_currency_pair
        URI("http://finance.yahoo.com/q?s=#{@first.downcase}#{@second.downcase}%3Dx&ql=1")
      end

      def request_feed
        Net::HTTP.get(url_for_currency_pair)
      end

      def bid_regexp
        first = @first.downcase
        second = @second.downcase
        /Bid:<\/th><td class="yfnc_tabledata1"><span id="yfs_b00_#{Regexp.escape(first)}#{Regexp.escape(second)}=x">([^\"]*)<\/span>/
      end
  end
end
