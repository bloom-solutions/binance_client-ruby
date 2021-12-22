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

    described_class::INTERVALS.each do |interval|
      describe "##{interval.downcase}?" do
        subject { rate_limit.send("#{interval.downcase}?") }
        context "#interval is #{interval}" do
          let(:rate_limit) do
            build(:binance_client_rate_limit, interval: interval)
          end
          it { is_expected.to be true }
        end

        context "#interval is not #{interval}" do
          let(:rate_limit) do
            build(:binance_client_rate_limit, {
              interval: (described_class::INTERVALS - [interval]).sample,
            })
          end
          it { is_expected.to be false }
        end
      end
    end

  end
end
