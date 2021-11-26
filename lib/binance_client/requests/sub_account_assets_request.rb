module BinanceClient
  class SubAccountAssetsRequest < BaseRequest
    attribute :email

    private

    def path
      "/sapi/v3/sub-account/assets"
    end

    def params
      params_without_signature.merge(signature_hash).to_query
    end

    def signature_hash
      { signature: signature(params_without_signature.to_query) }
    end

    def params_without_signature
      {email: email, timestamp: timestamp}
    end
  end
end
