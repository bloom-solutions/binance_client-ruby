module BinanceClient
  class GetAllRequest < BaseRequest
    private

    def path
      "/sapi/v1/capital/config/getall"
    end

    def query
      "timestamp=#{timestamp}"
    end

    def params
      [
        query,
        "signature=#{signature(query)}"
      ].join("&")
    end
  end
end
