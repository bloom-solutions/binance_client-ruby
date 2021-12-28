require 'spec_helper'

module BinanceClient
  RSpec.describe Coin do
    let(:raw_hash) do
      {
        "coin" => "BTC",
        "depositAllEnable" => true,
        "free" => "0.08074558",
        "freeze" => 0.1,
        "ipoable" => 0.2,
        "ipoing" => 0.3,
        "isLegalMoney" => false,
        "locked" => 0.4,
        "name" => "Bitcoin",
        "networkList" => [
          {
            "addressRegex" => "^abc$",
            "coin" => "BTC",
            "depositEnable" => true,
            "isDefault" => true,
            "memoRegex" => "",
            "minConfirm" => 1,
            "name" => "BTC",
            "network" => "BTC",
            "resetAddressStatus" => false,
            "specialTips" => "",
            "unLockConfirm" => 2,
            "withdrawEnable" => true,
            "withdrawFee" => "0.00050000",
            "withdrawIntegerMultiple" => "0.00000001",
            "withdrawMax" => "750",
            "withdrawMin" => "0.00100000",
            "sameAddress" => false
          }
        ],
        "storage" => 0.5,
        "trading" => true,
        "withdrawAllEnable" => true,
        "withdrawing" => 0.6
      }
    end
    subject(:coin) { described_class.new(raw_hash: raw_hash) }

    its(:coin) { is_expected.to eq "BTC" }
    its(:deposit_all_enable) { is_expected.to eq true }
    its(:deposit_all_enabled?) { is_expected.to eq true }
    its(:free) { is_expected.to eq 0.08074558 }
    its(:freeze) { is_expected.to eq 0.1 }
    its(:ipoable) { is_expected.to eq 0.2 }
    its(:ipoing) { is_expected.to eq 0.3 }
    its(:is_legal_money) { is_expected.to eq false }
    its(:legal_money?) { is_expected.to eq false }
    its(:locked) { is_expected.to eq 0.4 }
    its(:name) { is_expected.to eq "Bitcoin" }
    its(:storage) { is_expected.to eq 0.5 }
    its(:trading) { is_expected.to eq true }
    its(:trading?) { is_expected.to eq true }
    its(:withdraw_all_enable) { is_expected.to eq true }
    its(:withdraw_all_enabled?) { is_expected.to eq true }
    its(:withdrawing) { is_expected.to eq 0.6 }

    describe "#network_list" do
      it "is an array of Network" do
        network = coin.network_list.first

        aggregate_failures do
          expect(network).to be_a Network
          expect(network.withdraw_fee).to be_present
        end
      end
    end

  end
end
