require "spec_helper"

RSpec.describe "#order_book_depth", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
    )
  end

  it "returns the bids and asks of the order book" do
    response = client.order_book_depth(symbol: "BTCUSDT", limit: 20)

    order_book = response.order_book

    expect(order_book.last_update_id).to be_an Integer

    aggregate_failures do
      expect(order_book.bids.size).to eq 20

      bid = order_book.bids.sample
      expect(bid.price).to be_a BigDecimal
      expect(bid.quantity).to be_a BigDecimal
    end

    aggregate_failures do
      expect(order_book.asks.size).to eq 20

      ask = order_book.asks.sample
      expect(ask.price).to be_a BigDecimal
      expect(ask.quantity).to be_a BigDecimal
    end
  end
end
