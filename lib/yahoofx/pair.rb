require 'net/http'

module Yahoofx
  class Pair 
    # First and second currency code. The parameters could be "USD" and "EUR" for instance
    def initialize(first, second)
      @first, @second = first.to_s, second.to_s
      raise "Invalid currency code provided" unless @first.length==3 && @second.length==3
    end

    def bid
      request_feed.scan(bid_regexp).each { |results| return results.first.to_f }
    end

    protected
      def url_for_currency_pair
        URI("http://finance.yahoo.com/q?s=#{@first}#{@second}%3Dx&ql=1")
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
