module BinanceClient
  class BaseResponse
    include APIClientBase::Response.module

    attribute :body, Object, lazy: true, default: :default_body
    attribute :message, String, lazy: true, default: :default_message

    def used_weights
      @used_weights ||= headers.each_with_object({}) do |(key, value), hash|
        next if not key.include?("USED")
        next if not key.include?("WEIGHT")
        hash[key] = value
      end
    end

    def default_message
      body["message"].presence || body["msg"]
    end

    def body_code
      val = body["code"]
      return nil if val.nil?
      val.to_i
    end

    private

    def default_body
      JSON.parse(raw_response.body)
    end

  end
end
