module BinanceClient
  class BaseResponse
    include APIClientBase::Response.module

    attribute :body, Object, lazy: true, default: :default_body

    def used_weight(interval)
      val = header("X-MBX-USED-WEIGHT-#{interval}")
      return nil if val.nil?
      val.to_i
    end

    private

    def default_body
      JSON.parse(raw_response.body)
    end

  end
end
