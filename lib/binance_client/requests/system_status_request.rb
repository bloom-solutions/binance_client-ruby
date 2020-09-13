module BinanceClient
  class SystemStatusRequest
    include APIClientBase::Request.module(action: :get)

    def path
      "/wapi/v3/systemStatus.html"
    end

    def headers
      {
        "Content-Type" => "application/json"
      }
    end
  end
end
