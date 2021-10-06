require 'spec_helper'

module BinanceClient
  RSpec.describe OrderBookDepthRequest do

    describe "#params" do
      context "limit is present" do
        let(:request) { described_class.new(symbol: "BAC", limit: 50) }

        it "is included" do
          expect(request.params).to include("limit=50")
        end
      end

      context "limit is nil" do
        let(:request) { described_class.new(symbol: "BAC", limit: nil) }

        it "is not included" do
          expect(request.params).to_not include("limit")
        end
      end
    end

  end
end
