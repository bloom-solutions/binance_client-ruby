require 'spec_helper'

module BinanceClient
  RSpec.describe AccountResponse do

    let(:body) do
      {
        "makerCommission" => 15,
        "takerCommission" => 15,
        "buyerCommission" => 0,
        "sellerCommission" => 0,
        "canTrade" => true,
        "canWithdraw" => true,
        "canDeposit" => true,
        "updateTime" => 123456789,
        "accountType" => "SPOT",
        "balances" => [
          {
            "asset" => "BTC",
            "free" => "4723846.89208129",
            "locked" => "0.00000000"
          },
          {
            "asset" => "LTC",
            "free" => "4763368.68006011",
            "locked" => "0.0002"
          }
        ],
        "permissions" => [
          "SPOT"
        ]
      }
    end
    let(:response) do
      described_class.new(body: body)
    end

    it "exposes the body" do
      expect(response.maker_commission).to eq 15
      expect(response.taker_commission).to eq 15
      expect(response.buyer_commission).to eq 0
      expect(response.seller_commission).to eq 0
      expect(response.can_trade).to be true
      expect(response.can_withdraw).to be true
      expect(response.can_deposit).to be true
      expect(response.update_time).to eq 123456789
      expect(response.account_type).to eq "SPOT"

      balances = response.balances

      expect(balances.count).to eq 2

      btc_balance = balances.find do |asset_balance|
        asset_balance.asset == "BTC"
      end
      expect(btc_balance).to be_present
      expect(btc_balance.free).to eq 4723846.89208129
      expect(btc_balance.locked).to be_zero

      ltc_balance = balances.find do |asset_balance|
        asset_balance.asset == "LTC"
      end
      expect(ltc_balance).to be_present
      expect(ltc_balance.free).to eq 4763368.68006011
      expect(ltc_balance.locked).to eq 0.0002

      expect(response.permissions).to match_array("SPOT")
    end

  end
end
