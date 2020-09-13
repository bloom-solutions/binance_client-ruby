module BinanceClient
  class SystemStatusRequest < BaseRequest
    def path
      "/wapi/v3/systemStatus.html"
    end
  end
end
