require "spec_helper"

RSpec.describe "#sub_account_create_api_keys", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "creates api keys for the sub account" do
    response = client.sub_account_create_api_keys(
      sub_account_id: CONFIG[:sub_account_id],
      can_trade: true,
    )
    expect(response).to be_success

    aggregate_failures do
      expect(response.sub_account_id).to eq CONFIG[:sub_account_id]
      expect(response.api_key).to be_present
      expect(response.secret_key).to be_present
      expect(response.can_trade?).to be true
      expect(response.margin_trade?).to be false
      expect(response.futures_trade?).to be false
    end
  end
end
