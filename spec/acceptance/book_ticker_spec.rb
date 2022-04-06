require "spec_helper"

RSpec.describe "#book_ticker", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret]
    )
  end

  context "given a symbol, " do
    it "returns the book ticker for the given symbol" do
      response = client.book_ticker("ETHBTC")

      expect(response).to be_success

      book_tickers = response.book_tickers

      expect(book_tickers.count).to eq 1

      book_ticker = book_tickers.first

      expect(book_ticker.symbol).to eq "ETHBTC"
      expect(book_ticker.bid_price).to be_a BigDecimal
      expect(book_ticker.bid_qty).to be_a BigDecimal
      expect(book_ticker.ask_price).to be_a BigDecimal
      expect(book_ticker.ask_qty).to be_a BigDecimal
    end
  end

  context "given no symbol, " do
    it "returns the book tickers for all" do
      response = client.book_ticker

      expect(response).to be_success

      book_tickers = response.book_tickers

      expect(book_tickers).to_not be_empty

      book_ticker = book_tickers.sample

      expect(book_ticker.symbol).to be_a String
      expect(book_ticker.bid_price).to be_a BigDecimal
      expect(book_ticker.bid_qty).to be_a BigDecimal
      expect(book_ticker.ask_price).to be_a BigDecimal
      expect(book_ticker.ask_qty).to be_a BigDecimal
    end
  end
end
