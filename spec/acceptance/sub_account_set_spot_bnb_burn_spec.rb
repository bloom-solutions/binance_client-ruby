require "spec_helper"

RSpec.describe "#sub_account_set_spot_bnb_burn", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "sets spotBNBBurn on the sub account" do
    response = client.sub_account_set_spot_bnb_burn(CONFIG[:sub_account_id], false)
    expect(response).to be_success
    expect(response).to_not be_spot_bnb_burn

    response = client.sub_account_set_spot_bnb_burn(CONFIG[:sub_account_id], true)
    expect(response).to be_success
    expect(response).to be_spot_bnb_burn
  end
end
