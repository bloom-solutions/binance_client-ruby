require 'spec_helper'

module BinanceClient
  RSpec.describe SubAccountTransferHistoryRequest do

    [:start_time, :end_time].each do |method_name|
      describe "##{method_name}=" do
        it "converts to an Integer, Binance-style" do
          request = described_class.new(method_name => Time.at(1659945115))
          expect(request.send(method_name)).to eq 1659945115 * 1_000
        end

        it "handles nil assignment" do
          request = described_class.new(method_name => nil)
          expect(request.send(method_name)).to be_nil
        end
      end
    end

  end
end
