module BinanceClient
  class BookTickerResponse < BaseResponse

    def book_tickers
      book_ticker_hashes = [body].flatten

      @book_tickers ||= book_ticker_hashes.map do |book_ticker_hash|
        BookTicker.new_from_raw_hash(book_ticker_hash)
      end
    end

  end
end
