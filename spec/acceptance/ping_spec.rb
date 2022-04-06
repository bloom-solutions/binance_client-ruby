require "spec_helper"

RSpec.describe "Ping", vcr: {record: :once} do

  it "tests rest api connectivity" do
    client = BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )

    response = client.ping

    expect(response).to be_success, response.message
  end

end
