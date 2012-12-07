require_relative "../test_helper"
#p YahooFx::Pair.new(:eur, :usd).bid

describe Yahoofx do
  before do
    page = IO.read(File.dirname(__FILE__) + '/../fixtures/eurusd.html') 
    stub_request(:get, "http://finance.yahoo.com/q?ql=1&s=eurusd=x").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => page, :headers => {})
  end

  it "should return correct bid" do
    assert_equal 1.2967, Yahoofx::Pair.new(:eur, :usd).bid
  end

end
