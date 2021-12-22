require 'spec_helper'

module BinanceClient
  RSpec.describe MarketFilter do

    let(:raw_hash) do
      {
        "filterType" => "PRICE_FILTER",
        "minPrice" => "0.00000100",
        "maxPrice" => "922327.00000000",
        "tickSize" => "0.00000100",
        "somethingElse" => "ABC that is not a number 123",
      }
    end
    subject(:market_filter) { described_class.new(raw_hash: raw_hash) }

    its(:filter_type) { is_expected.to eq "PRICE_FILTER" }
    its(:min_price) { is_expected.to eq 0.000001 }
    its(:max_price) { is_expected.to eq 922327.0 }
    its(:tick_size) { is_expected.to eq 0.000001 }
    its(:something_else) { is_expected.to eq "ABC that is not a number 123" }

  end
end
