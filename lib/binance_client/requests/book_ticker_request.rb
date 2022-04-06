module BinanceClient
  class BookTickerRequest < BaseRequest
    attribute :symbol

    def path
      "/api/v3/ticker/bookTicker"
    end

    def params
      {}.tap do |hash|
        hash[:symbol] = symbol if symbol
      end.to_query
    end
  end
end
