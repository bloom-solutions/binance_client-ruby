require "spec_helper"

RSpec.describe "Withdraw", vcr: {record: :once} do

  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret],
    )
  end
  let(:deposit_address_response) do
    client.sub_account_deposit_address({
      email: CONFIG[:sub_account_email],
      coin: "BTC",
    })
  end
  let(:deposit_address) { deposit_address_response.deposit_address.address }
  let(:balances) { client.account.balances }
  let(:btc_balance) { balances.find {|ab| ab.asset == "BTC"} }

  before do
    expect(btc_balance.free).to be >= 0.0005,
      "Needs a balance greater than 0.0005 to proceed with the test. " \
      "Current balance is #{btc_balance.free}"
  end

  it "creates a withdrawal" do
    response = client.withdraw(
      coin: "BTC",
      address: deposit_address,
      amount: 0.0005,
      transaction_fee_flag: true,
      name: "Tag with this name",
    )

    expect(response).to be_success,
      "This failed: #{response.message}; you probably need to enable " \
      "withdrawals for the master API and whitelist your IP"

    expect(response.withdrawal_id).to be_present
  end

end
