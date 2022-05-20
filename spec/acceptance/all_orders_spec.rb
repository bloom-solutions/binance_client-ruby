require "spec_helper"

RSpec.describe "#all_orders", vcr: { record: :once } do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:sub_account_api_key],
      api_secret: CONFIG[:sub_account_api_secret]
    )
  end

  it "retrieves all orders within a timeframe" do
    response = client.all_orders("ETHUSDT", "1651298308000")

    expect(response).to be_success
  end
end
