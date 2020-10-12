module BinanceClient
  class BaseResponse

    include APIClientBase::Response.module

    attribute :body, Object, default: :default_body
    attribute :error, String, default: :default_error

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    def default_error
      return nil if success?

      if body["code"] == -1022
        raise BinanceSignatureError, body["msg"]
      end
    end

  end
end
