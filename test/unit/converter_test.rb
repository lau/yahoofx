require_relative "../test_helper"

describe Yahoofx::Converter do
  before do
    mock_eur_dkk_bid = MiniTest::Mock.new
    mock_eur_dkk_bid.expect(:bid, 7.4556)
    mock_rate_pair_class = MiniTest::Mock.new
    mock_rate_pair_class.expect(:new, mock_eur_dkk_bid, ['EUR', 'DKK'])
    @converter = Yahoofx::Converter.new(mock_rate_pair_class)
  end

  it "should return correct bid" do
    assert_equal 745.56, @converter.convert("100 EUR in DKK").to_f
  end

end
