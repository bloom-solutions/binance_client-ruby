require 'spec_helper'

module BinanceClient
  RSpec.describe SubAccountDepositHistoryRequest do

    describe "#params" do
      %w[
        subAccountId
        coin
        status
        limit
        offset
      ].each do |key|
        context "#{key}" do
          let(:method_name) { key.underscore.to_sym }
          let(:request) do
            described_class.new({
              api_secret: "23",
              method_name => "something"
            })
          end
          subject { request.params }

          it { is_expected.to include("#{key}=something") }
        end
      end

      %w[
        startTime
        endTime
      ].each do |time_key|
        context "#{time_key}" do
          let(:method_name) { time_key.underscore.to_sym }
          let(:time) { DateTime.now }
          let(:request) do
            described_class.new({
              api_secret: "23",
              method_name => time,
            })
          end
          let(:expected_value) { time.to_i * 1_000 }
          subject { request.params }

          it { is_expected.to include("#{time_key}=#{expected_value}") }
        end
      end
    end

  end
end
