require "spec_helper"

RSpec.describe "#create_test_order", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:sub_account_api_key],
      api_secret: CONFIG[:sub_account_api_secret]
    )
  end

  it "creates a test order" do
    response = client.create_test_order(
      symbol: "BTCUSDT",
      side: "SELL",
      type: "MARKET",
      quantity: 0.0005,
    )
    expect(response).to be_success, response.message
  end
end
