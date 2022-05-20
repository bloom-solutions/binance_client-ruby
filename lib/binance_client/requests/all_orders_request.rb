module BinanceClient
  class AllOrdersRequest < AuthenticatedBaseRequest
    attribute :symbol, String
    attribute :start_time, Integer

    def path
      "/api/v3/allOrders"
    end

    def params_without_signature
      {
        symbol: symbol,
        startTime: start_time
      }
    end
  end
end
