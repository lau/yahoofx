require_relative "../test_helper"

describe Yahoofx::Pair do
  before do
    page = IO.read(File.dirname(__FILE__) + '/../fixtures/eurusd.html') 
    stub_request(:get, "http://finance.yahoo.com/q?ql=1&s=eurusd=x").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => page, :headers => {})
  end

  it "should return correct bid" do
    assert_equal 1.2967, Yahoofx::Pair.new(:eur, :usd).bid
  end

  describe "when providing a currency code that's not 3 letters" do
    it "should raise an exception" do
      proc {Yahoofx::Pair.new(:usd, :foooo)}.must_raise(RuntimeError)
      proc {Yahoofx::Pair.new(:us1, :eur)}.must_raise(RuntimeError)
    end
  end
end
