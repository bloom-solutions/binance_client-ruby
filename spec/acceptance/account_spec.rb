require "spec_helper"

RSpec.describe "Get account information", vcr: {record: :once} do

  it "returns the account information found in /api/v3/account" do
    client = BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:sub_account_api_key],
      api_secret: CONFIG[:sub_account_api_secret],
    )

    response = client.account

    expect(response).to be_success, response.message

    expect(response.maker_commission).to be_present
    expect(response.balances).to be_present
  end

end
