module BinanceClient
  class GetAllRequest < BaseRequest
    private

    def path
      "/sapi/v1/capital/config/getall"
    end

    def query
      uri = Addressable::URI.new(query_values: {
        timestamp: timestamp,
      })
      uri.normalized_query
    end

    def params
      uri = Addressable::URI.new(query: query)
      uri.query_values = [
        uri.query,
        ["signature", signature(query)],
      ]
      uri.normalized_query
    end
  end
end
