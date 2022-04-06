module BinanceClient
  class CreateSubAccountRequest < AuthenticatedBaseRequest
    attribute :tag

    private

    def path
      "/sapi/v1/broker/subAccount"
    end

    def default_action
      :post
    end

    def params_without_signature
      {}
    end
  end
end
