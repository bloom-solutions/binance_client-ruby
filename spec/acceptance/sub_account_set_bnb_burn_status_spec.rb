require "spec_helper"

RSpec.describe "#sub_account_set_bnb_burn_status", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "sets the account's BNB burn status" do
    response =
      client.sub_account_set_bnb_burn_status(CONFIG[:sub_account_id], true)
    expect(response).to be_success, "Is Spot & Margin Trading must enabled?"

    aggregate_failures do
      expect(response.sub_account_id).to eq CONFIG[:sub_account_id]
      expect(response.spot_bnb_burn?).to be true
    end
  end
end
