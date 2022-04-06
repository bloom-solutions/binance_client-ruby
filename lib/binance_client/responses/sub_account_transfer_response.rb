module BinanceClient
  class SubAccountTransferResponse < BaseResponse

    attribute :txn_id, Integer, lazy: true, default: :default_txn_id
    attribute :client_tran_id, String, lazy: true, default: :default_client_tran_id

    private

    def default_txn_id
      body["txnId"]
    end

    def default_client_tran_id
      body["clientTranId"]
    end

  end
end
