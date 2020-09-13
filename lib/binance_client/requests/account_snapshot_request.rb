module BinanceClient
  class AccountSnapshotRequest < BaseRequest
    private

    def path
      "/sapi/v1/accountSnapshot"
    end

    def params
      type = "SPOT"
      limit = 30
      query = query(type: type, limit: limit)

      [
        query,
        "signature=#{signature(query)}"
      ].join("&")
    end

    def query(options={})
      [
        "type=#{options[:type]}",
        "timestamp=#{timestamp}",
        "limit=#{options[:limit]}",
      ].join("&")
    end
  end
end
