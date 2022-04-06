require "spec_helper"

RSpec.describe "#create_order", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:sub_account_api_key],
      api_secret: CONFIG[:sub_account_api_secret]
    )
  end

  it "creates an order" do
    response = client.create_order(
      symbol: "BTCUSDT",
      side: "SELL",
      type: "MARKET",
      quantity: 0.0005,
    )

    expect(response).to be_success, response.message

    expect(response.symbol).to eq "BTCUSDT"
    expect(response.executed_qty).to eq 0.0005
    expect(response.fills.count).to be > 0
  end
end
