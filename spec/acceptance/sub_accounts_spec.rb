require "spec_helper"

RSpec.describe "#sub_accounts", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "returns the list of the sub-accounts" do
    response = client.sub_accounts
    expect(response).to be_success

    sub_accounts = response.sub_accounts

    expect(sub_accounts).to be_an Array
    expect(sub_accounts).to be_present

    sub_account = sub_accounts.sample

    aggregate_failures do
      expect(sub_account.sub_account_id).to be_an Integer
      expect(sub_account.email).to be_a String
    end
  end
end
