module BinanceClient
  class SubAccountSetSpotBnbBurnRequest < AuthenticatedBaseRequest
    attribute :sub_account_id
    attribute :spot_bnb_burn_status

    private

    def path
      "/sapi/v1/broker/subAccount/bnbBurn/spot"
    end

    def default_action
      :post
    end

    def params_without_signature
      {subAccountId: sub_account_id, spotBNBBurn: spot_bnb_burn_status}
    end
  end
end
