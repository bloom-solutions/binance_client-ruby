require 'spec_helper'

RSpec.describe "#sub_account_transfer_history", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  it "fetches the sub-account's transfer history" do
    response = client.sub_account_transfer_history

    expect(response).to be_success

    transfer = response.transfers.sample

    expect(transfer.from_id).to be_present
  end

end
