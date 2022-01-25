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

      coin = response.coins.sample

      BinanceClient::Coin::METHODS.each do |method_name|
        expect(coin.send(method_name)).to_not be_nil, "##{method_name} was nil"
      end

      network = coin.network_list.sample
      BinanceClient::Network::METHODS.each do |method_name|
        expect(network.send(method_name)).to_not be_nil, "##{method_name} was nil"
      end
    end
  end
end
