require 'spec_helper'

module BinanceClient
  RSpec.describe Deposit do

    let(:raw_hash) do
      {
        # The example Binance gives in
        # https://binance-docs.github.io/Brokerage-API/Brokerage_Operation_Endpoints/#get-sub-account-deposit-history
        # differs from what they actually returned. They return subAccountId
        # and not subaccountId
        "subAccountId" => "1",
        "address" => "0xddc66e4313fd6c737b6cae67cad90bb4e0ac7092",
        "addressTag" => "tag",
        "amount" => "139.04370000",
        "coin" => "USDT",
        "insertTime" => 1566791463000,
        "network" => "ETH",
        "status" => 1,
        "txId" => "0x575",
        "sourceAddress" => "xxxxxxxxxxxxxx",
        "confirmTimes" =>"12/12",
      }
    end

    subject(:deposit) { described_class.new(raw_hash: raw_hash) }

    its(:sub_account_id) { is_expected.to eq 1 }
    its(:address) { is_expected.to eq "0xddc66e4313fd6c737b6cae67cad90bb4e0ac7092" }
    its(:address_tag) { is_expected.to eq "tag" }
    its(:amount) { is_expected.to eq "139.04370000" }
    its(:coin) { is_expected.to eq "USDT" }
    its(:insert_time) { is_expected.to eq Time.at(1566791463000/1000) }
    its(:network) { is_expected.to eq "ETH" }
    its(:status) { is_expected.to eq 1 }
    its(:tx_id) { is_expected.to eq "0x575" }
    its(:source_address) { is_expected.to eq "xxxxxxxxxxxxxx" }
    its(:confirm_times) { is_expected.to eq "12/12" }

  end
end
