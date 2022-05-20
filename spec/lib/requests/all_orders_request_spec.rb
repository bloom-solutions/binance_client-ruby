require 'spec_helper'

module BinanceClient
  RSpec.describe AllOrdersRequest do

    describe "#params" do
      context "with all options" do
        let(:request) do
          described_class.new(
            api_key: CONFIG[:api_key],
            api_secret: CONFIG[:api_secret],

            symbol: "ETHUSDT",
            start_time: 1653013822614,
          )
        end
        subject(:params) { request.params }

        it "builds parameters" do
          aggregate_failures do
            expect(params).to include("symbol=ETHUSDT")
            expect(params).to include("startTime=1653013822614")
          end
        end
      end
    end
  end
end
