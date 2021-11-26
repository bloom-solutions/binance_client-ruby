module BinanceClient
  class SubAccountAssetsRequest < AuthenticatedBaseRequest
    attribute :email

    private

    def path
      "/sapi/v3/sub-account/assets"
    end

    def params_without_signature
      {email: email}
    end
  end
end
