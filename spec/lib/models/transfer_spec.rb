require 'spec_helper'

module BinanceClient
  RSpec.describe Transfer do

    subject(:transfer) do
      described_class.new(raw_hash: {
        fromId: "1",
        toId: "2",
        asset: "BTC",
        qty: "1",
        time: 1544433328000,
        txnId: "2966662589",
        clientTranId: "abc",
        status: "SUCCESS",
      }.stringify_keys)
    end

    its(:from_id) { is_expected.to eq "1" }
    its(:to_id) { is_expected.to eq "2" }
    its(:asset) { is_expected.to eq "BTC" }
    its(:qty) { is_expected.to eq "1" }
    its(:time) { is_expected.to eq 1544433328000 }
    its(:txn_id) { is_expected.to eq "2966662589" }
    its(:client_tran_id) { is_expected.to eq "abc" }
    its(:status) { is_expected.to eq "SUCCESS" }

  end
end
