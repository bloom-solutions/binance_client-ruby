require "spec_helper"

RSpec.describe "#exchange_info", vcr: {record: :once} do

  it "returns market info" do
    client = BinanceClient.new(host: CONFIG[:host])

    response = client.exchange_info

    aggregate_failures do
      expect(response).to be_success
      expect(response.timezone).to be_present
      expect(response.symbols).to be_present
    end
  end

end
