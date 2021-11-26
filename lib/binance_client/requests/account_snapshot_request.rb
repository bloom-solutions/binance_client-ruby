module BinanceClient
  class AccountSnapshotRequest < AuthenticatedBaseRequest
    private

    def path
      "/sapi/v1/accountSnapshot"
    end

    def params_without_signature
      { type: "SPOT", limit: 30 }
    end

  end
end
