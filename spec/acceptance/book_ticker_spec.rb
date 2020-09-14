require "spec_helper"

RSpec.describe "Get Best price/qty on the order book", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "returns a hash of best prices for a specific symbol" do
    response = client.book_ticker(symbol: "ETHBTC")

    expect(response.code).to eq 200
    expect(response.body).not_to be_empty
    expect(response.body.keys).to include("symbol", "bidPrice", "bidQty")
  end
end
