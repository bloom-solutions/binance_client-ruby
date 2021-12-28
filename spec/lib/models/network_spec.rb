require 'spec_helper'

module BinanceClient
  RSpec.describe Network do
    let(:raw_hash) do
      {
        "addressRegex" => "^(bnb1)[0-9a-z]{38}$",
        "coin" => "BTC",
        "depositDesc" => "Wallet Maintenance",
        "depositEnable" => false,
        "isDefault" => false,
        "memoRegex" => "^[0-9A-Za-z\\-_]{1,120}$",
        "minConfirm" => 1,
        "name" => "BEP2",
        "network" => "BNB",
        "resetAddressStatus" => false,
        "specialTips" => "Both a MEMO is required",
        "unLockConfirm" => 0,
        "withdrawDesc" => "Wallet Maintenance",
        "withdrawEnable" => false,
        "withdrawFee" => "0.00000220",
        "withdrawIntegerMultiple" => "0.00000001",
        "withdrawMax" => "9999999999.99999999",
        "withdrawMin" => "0.00000440",
        "sameAddress" => true,
      }
    end
    subject(:network) { described_class.new(raw_hash: raw_hash) }

    its(:address_regex) { is_expected.to eq "^(bnb1)[0-9a-z]{38}$" }
    its(:coin) { is_expected.to eq "BTC" }
    its(:deposit_desc) { is_expected.to eq "Wallet Maintenance" }
    its(:deposit_enable) { is_expected.to be false }
    its(:deposit_enabled?) { is_expected.to be false }
    its(:is_default) { is_expected.to be false }
    its(:default?) { is_expected.to be false }
    its(:memo_regex) { is_expected.to eq "^[0-9A-Za-z\\-_]{1,120}$" }
    its(:min_confirm) { is_expected.to eq 1 }
    its(:name) { is_expected.to eq "BEP2" }
    its(:network) { is_expected.to eq "BNB" }
    its(:reset_address_status) { is_expected.to be false }
    its(:reset_address_status?) { is_expected.to be false }
    its(:special_tips) { is_expected.to eq "Both a MEMO is required" }
    its(:un_lock_confirm) { is_expected.to eq 0 }
    its(:withdraw_desc) { is_expected.to eq "Wallet Maintenance" }
    its(:withdraw_enable) { is_expected.to be false }
    its(:withdraw_enabled?) { is_expected.to be false }
    its(:withdraw_fee) { is_expected.to eq "0.00000220" }
    its(:withdraw_integer_multiple) { is_expected.to eq "0.00000001" }
    its(:withdraw_max) { is_expected.to eq "9999999999.99999999" }
    its(:withdraw_min) { is_expected.to eq "0.00000440" }
    its(:same_address) { is_expected.to be true }
    its(:same_address?) { is_expected.to be true }

  end
end
