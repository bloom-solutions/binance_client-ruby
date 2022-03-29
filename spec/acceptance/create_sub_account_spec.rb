require "spec_helper"

RSpec.describe "#create_sub_account", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "creates a sub account" do
    response = client.create_sub_account
    expect(response).to be_success, response.message

    expect(response.sub_account_id).to be_an Integer
    expect(response.email).to be_present
  end
end
