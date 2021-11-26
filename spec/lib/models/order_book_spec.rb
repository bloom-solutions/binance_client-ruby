require 'spec_helper'

module BinanceClient
  RSpec.describe OrderBook do

    let(:body) do
      {
        "lastUpdateId" => 1027024,
        "bids" => [
          [
            "4.00000000",
            "431.00000000"
          ]
        ],
        "asks" => [
          [
            "4.00000200",
            "12.00000000"
          ],
          [
            "8.00000010",
            "14.00000000"
          ]
        ]
      }
    end

    subject(:order_book) { described_class.new(body: body) }

    its(:last_update_id) { is_expected.to eq 1027024 }

    describe "#bids" do
      it "returns an array of OrderBookEntry objects" do
        entry = order_book.bids.first

        expect(entry).to be_an OrderBookEntry
        expect(entry.price).to eq 4.0
        expect(entry.quantity).to eq 431.0
      end
    end

    describe "#asks" do
      it "returns an array of OrderBookEntry objects" do
        entry = order_book.asks.last

        expect(entry).to be_an OrderBookEntry
        expect(entry.price).to eq 8.0000001.to_d
        expect(entry.quantity).to eq 14.0
      end
    end

  end
end
