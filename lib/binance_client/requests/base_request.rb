module BinanceClient
  class BaseRequest
    include APIClientBase::Request.module

    attribute :api_key, String
    attribute :api_secret, String
    attribute :timestamp, Integer, lazy: true, default: :default_timestamp

    def headers
      {
        "Content-Type" => "application/json",
        "X-MBX-APIKEY" => api_key
      }
    end

    def signature(query)
      OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new("sha256"),
        api_secret,
        query,
      )
    end

    def default_timestamp
      DateTime.now.strftime("%Q")
    end
  end
end
