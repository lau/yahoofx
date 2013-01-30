require_relative "../test_helper"

describe Yahoofx::Converter do
  before do
    mock_eur_dkk_bid = MiniTest::Mock.new
    mock_eur_dkk_bid.expect(:bid, 7.4556)
    mock_rate_pair_class = MiniTest::Mock.new
    mock_rate_pair_class.expect(:new, mock_eur_dkk_bid, ['EUR', 'DKK'])
    @converter = Yahoofx::Converter.new(mock_rate_pair_class)
  end

  it "should convert amount from one to the other" do
    assert_equal 745.56, @converter.convert("100 EUR in DKK").to_f
  end

  describe "when calling answer method" do
    it "should convert amount when it looks like a conversion" do
      assert_equal 745.56, @converter.answer("100 EUR in DKK").to_f
    end
    
    it "should work the same without space between amount and 'from currency'" do
      assert_equal 745.56, @converter.answer("100EUR in DKK").to_f
    end
    
    it "should show currency rate when two valid currency codes are provided" do
      assert_equal 7.4556, @converter.answer("EURDKK").to_f
    end

    it "should work with decimal in amount" do
      assert_equal 11.92896, @converter.answer("1.6EUR in DKK").to_f
    end
  end
end
