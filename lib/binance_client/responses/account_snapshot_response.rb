module BinanceClient
  class AccountSnapshotResponse
    include APIClientBase::Response.module

    attribute :body, Object, default: :default_body

    private

    def default_body
      JSON.parse(raw_response.body)
    end
  end
end
