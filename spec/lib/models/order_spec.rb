require 'spec_helper'

module BinanceClient
  RSpec.describe Order do
    subject(:order) do
      described_class.new({
        symbol: "ETHUSDT",
        executed_quantity: "1.20000000",
        cummulative_quote_quantity: "2769.10800000",
        order_id: 8848559626,
        side: "BUY",
      })
    end

    its(:symbol) { is_expected.to eq "ETHUSDT" }
    its(:executed_quantity) { is_expected.to eq "1.20000000" }
    its(:cummulative_quote_quantity) { is_expected.to eq "2769.10800000" }
    its(:order_id) { is_expected.to eq 8848559626 }
    its(:side) { is_expected.to eq "BUY" }
  end
end
