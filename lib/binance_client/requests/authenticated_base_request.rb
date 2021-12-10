module BinanceClient
  class AuthenticatedBaseRequest < BaseRequest
    include APIClientBase::Request.module

    attribute :recv_window, Integer

    def signature
      OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new("sha256"),
        api_secret,
        params_without_signature_with_timestamp_and_recv_window.to_query,
      )
    end

    def signature_hash
      { signature: signature }
    end

    def timestamp
      @timestamp ||= DateTime.now.strftime("%Q")
    end

    def params
      params_without_signature_with_timestamp_and_recv_window.
        merge(signature_hash).to_query
    end

    def params_without_signature_with_timestamp_and_recv_window
      attrs_to_merge = { timestamp: timestamp }
      attrs_to_merge[:recvWindow] = recv_window if recv_window.present?
      params_without_signature.merge(attrs_to_merge)
    end

    def params_without_signature
      {}
    end

  end
end
