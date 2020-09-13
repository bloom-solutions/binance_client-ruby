require "spec_helper"

RSpec.describe "Fetch system status" do
  it "returns a hash of current api status" do
    client = BinanceClient.new(
      host: CONFIG[:host],
      key: CONFIG[:api_key],
      secret: CONFIG[:api_secret]
    )

    system_status_response = client.system_status

    expect(system_status_response.msg).to eq "normal"
    expect(system_status_response.status).to eq "0"
  end
end
