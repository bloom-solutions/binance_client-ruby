require "spec_helper"

RSpec.describe "Get information of coins for user" do
  it "returns an array of coin details" do
    client = BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )

    response = client.get_all

    expect(response.code).to eq 200
    expect(response.body).not_to be_empty

    # we're just checking here that the body is valid structure
    expect(response.body.first[1].keys).to include("coin")
  end
end
