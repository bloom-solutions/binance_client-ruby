module BinanceClient
  class BaseRequest
    include APIClientBase::Request.module

    attribute :api_key, String
    attribute :api_secret, String

    def headers
      {
        "Content-Type" => "application/json",
        "X-MBX-APIKEY" => api_key
      }
    end

  end
end
