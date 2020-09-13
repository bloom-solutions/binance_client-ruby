module BinanceClient
  class BaseResponse
    include APIClientBase::Response.module

    attribute :body, Object, default: :default_body

    private

    def default_body
      JSON.parse(raw_response.body)
    end
  end
end
