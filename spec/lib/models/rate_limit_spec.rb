require 'spec_helper'

module BinanceClient
  RSpec.describe RateLimit do

    let(:raw_hash) do
      {
        "rateLimitType" => "RAW_REQUESTS",
        "interval" => "MINUTE",
        "intervalNum" => 5,
        "limit" => 6100,
      }
    end
    subject(:rate_limit) { described_class.new(raw_hash: raw_hash) }

    its(:rate_limit_type) { is_expected.to eq "RAW_REQUESTS" }
    its(:interval) { is_expected.to eq "MINUTE" }
    its(:interval_num) { is_expected.to eq 5 }
    its(:limit) { is_expected.to eq 6_100 }

  end
end
