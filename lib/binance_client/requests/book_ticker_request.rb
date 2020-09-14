module BinanceClient
  class BookTickerRequest < BaseRequest
    attribute :symbol

    def path
      "/api/v3/ticker/bookTicker"
    end

    def params
      {symbol: symbol}.to_query
    end
  end
end
