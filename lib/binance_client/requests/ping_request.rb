module BinanceClient
  class PingRequest < BaseRequest

    private

    def path
      "/api/v3/ping"
    end

  end
end
