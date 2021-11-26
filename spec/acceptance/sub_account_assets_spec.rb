require "spec_helper"

RSpec.describe "#sub_account_assets", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  # Works with Sub-accounts only and uses the master's api keys
  it "returns the sub-account's assets" do
    response = client.sub_account_assets(CONFIG[:sub_account_email])
    expect(response).to be_success

    asset_balances = response.balances

    expect(asset_balances).to be_an Array
    expect(asset_balances).to be_present

    asset_balance = asset_balances.sample
    aggregate_failures do
      expect(asset_balance.asset).to be_a String
      expect(asset_balance.free).to be_a BigDecimal
      expect(asset_balance.locked).to be_a BigDecimal
    end
  end
end
