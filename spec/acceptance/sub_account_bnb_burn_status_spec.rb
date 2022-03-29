require "spec_helper"

RSpec.describe "#sub_account_bnb_burn_status", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "returns the status of the sub-account's bnb burn" do
    response = client.sub_account_bnb_burn_status(CONFIG[:sub_account_id])
    expect(response).to be_success

    expect(response).to be_spot_bnb_burn
  end
end
