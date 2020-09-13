require "spec_helper"

RSpec.describe "get current balances of an account" do
  context "for spot accounts" do
    it "returns an array of daily snapshots of the account balances" do
      client = BinanceClient.new(
        host: CONFIG[:host],
        api_key: CONFIG[:api_key],
        api_secret: CONFIG[:api_secret]
      )

      response = client.account_snapshot

      expect(response.code).to eq 200
    end
  end
end
