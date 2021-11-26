module BinanceClient
  class AuthenticatedBaseRequest < BaseRequest
    include APIClientBase::Request.module

    def signature
      OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new("sha256"),
        api_secret,
        params_without_signature_with_timestamp.to_query,
      )
    end

    def signature_hash
      { signature: signature }
    end

    def timestamp
      @timestamp ||= DateTime.now.strftime("%Q")
    end

    def params
      params_without_signature_with_timestamp.merge(signature_hash).to_query
    end

    def params_without_signature_with_timestamp
      params_without_signature.merge(timestamp: timestamp)
    end

    def params_without_signature
      {}
    end

  end
end
