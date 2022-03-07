require "spec_helper"

RSpec.describe "#sub_account_deposit_address", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "returns the account's deposit address" do
    response =
      client.sub_account_deposit_address(email: CONFIG[:sub_account_email], coin: "BTC", network: "BNB")
    expect(response).to be_success

    deposit_address = response.deposit_address

    expect(deposit_address).to be_a BinanceClient::DepositAddress

    aggregate_failures do
      expect(deposit_address.address).to be_a String
      expect(deposit_address.address).to be_present
      expect(deposit_address.coin).to be_a String
      expect(deposit_address.coin).to be_present
      expect(deposit_address.tag).to be_a String
      expect(deposit_address.tag).to be_present
    end
  end
end
