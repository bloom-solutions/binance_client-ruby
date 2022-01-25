require "spec_helper"

RSpec.describe "#sub_account_bnb_burn_status", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "returns the account's BNB burn status" do
    response = client.sub_account_bnb_burn_status(CONFIG[:sub_account_id])
    expect(response).to be_success

    aggregate_failures do
      expect(response.sub_account_id).to eq CONFIG[:sub_account_id]
      expect([true, false]).to include response.spot_bnb_burn?

      # Our dev account didn't return a value for interestBNBBurn,
      # so just check that the response has that method
      expect(response).to respond_to(:interest_bnb_burn?)
    end
  end
end
