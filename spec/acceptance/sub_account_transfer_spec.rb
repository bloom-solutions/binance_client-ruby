require "spec_helper"

RSpec.describe "#sub_account_transfer", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end
  let(:client_transaction_id) { "640e5c61030781313301a65e551db749" }

  it "transfers from one account to another" do
    create_account_response = client.create_sub_account
    expect(create_account_response).to be_success

    new_sub_account_id = create_account_response.sub_account_id
    new_sub_account_email = create_account_response.email

    response = client.sub_account_transfer(
      from_id: CONFIG[:sub_account_id],
      to_id: new_sub_account_id,
      client_tran_id: client_transaction_id,
      asset: "BTC",
      amount: "0.0001",
    )

    expect(response).to be_success

    aggregate_failures do
      expect(response.txn_id).to be_an Integer
      expect(response.client_tran_id).to be_present
    end

    # Wait until binance registers the transfer
    Wait.new(attempts: 10).until do
      asset_balance_response = client.sub_account_assets(new_sub_account_email)
      asset_balances = asset_balance_response.balances
      btc_asset_balance = asset_balances.find {|ab| ab.asset == "BTC"}

      btc_asset_balance.present? &&
        btc_asset_balance.free > 0
    end

    # Try to return it so there's less cleanup
    # NOTE: commenting out for now because even if the above code says the new
    # account has a free balance, we get "General error" when trying to
    # transfer it back.
    # response_2 = client.sub_account_transfer(
    #   from_id: 429844732,
    #   to_id: CONFIG[:sub_account_id],
    #   client_tran_id: client_transaction_id,
    #   asset: "BTC",
    #   amount: "0.0001",
    # )

    # expect(response_2).to be_success
  end
end
