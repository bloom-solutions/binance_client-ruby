module BinanceClient
  class OrderBookDepthRequest < BaseRequest

    attribute :symbol, String
    attribute :limit, Integer

    def path
      "/api/v3/depth"
    end

    def params
      h = {symbol: symbol}
      h[:limit] = limit if not limit.nil?
      h.to_query
    end

  end
end
