module BinanceClient
  class SubAccountBnbBurnStatusRequest < AuthenticatedBaseRequest
    attribute :sub_account_id

    private

    def path
      "/sapi/v1/broker/subAccount/bnbBurn/status"
    end

    def params_without_signature
      {subAccountId: sub_account_id}
    end
  end
end
