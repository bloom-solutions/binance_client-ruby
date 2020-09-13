module BinanceClient
  class SystemStatusResponse
    include APIClientBase::Response.module

    attribute :body, Object, default: :default_body
    attribute :msg, String, lazy: true, default: :default_msg
    attribute :status, String, lazy: true, default: :default_status

    private

    def default_body
      JSON.parse(raw_response.body).with_indifferent_access
    end

    def default_msg
      body[:msg]
    end

    def default_status
      body[:status]
    end
  end
end