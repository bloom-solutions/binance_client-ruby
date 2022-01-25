module BinanceClient
  class SubAccountSetBnbBurnStatusRequest < AuthenticatedBaseRequest
    attribute :sub_account_id
    attribute :spot_bnb_burn

    private

    def path
      "/sapi/v1/broker/subAccount/bnbBurn/spot"
    end

    def action
      :post
    end

    def params_without_signature
      {subAccountId: sub_account_id, spotBNBBurn: spot_bnb_burn}
    end
  end
end
