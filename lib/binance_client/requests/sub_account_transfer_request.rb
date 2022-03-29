module BinanceClient
  class SubAccountTransferRequest < AuthenticatedBaseRequest
    attribute :from_id
    attribute :to_id
    attribute :client_tran_id
    attribute :asset
    attribute :amount

    private

    def path
      "/sapi/v1/broker/transfer"
    end

    def default_action
      :post
    end

    def params_without_signature
      {
        fromId: from_id,
        toId: to_id,
        clientTranId: client_tran_id,
        asset: asset,
        amount: amount,
      }
    end
  end
end
