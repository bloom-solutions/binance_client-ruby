module BinanceClient
  class ExchangeInfoResponse < BaseResponse

    def timezone
      body["timezone"]
    end

    def timezone
      body["timezone"]
    end

    def server_time
      body["serverTime"]
    end

    def markets
      @markets ||= body["symbols"].map do |market_hash|
        Market.new(raw_hash: market_hash)
      end
    end
    alias_method :symbols, :markets

    def rate_limits
      @rate_limits ||= body["rateLimits"].map do |rate_limit_hash|
        RateLimit.new(raw_hash: rate_limit_hash)
      end
    end

  end
end
