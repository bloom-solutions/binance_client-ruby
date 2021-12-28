require "spec_helper"

RSpec.describe "Get information of coins for user", vcr: { record: :once} do
  it "returns an array of coin details" do
    client = BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )

    response = client.coins_info

    aggregate_failures do
      expect(response).to be_success
      expect(response.coins).not_to be_empty
      expect(response.coins.first.coin).to be_a String
    end
  end
end