module BinanceClient
  class SubAccountSetBnbBurnStatusResponse < BaseResponse

    def sub_account_id
      body["subAccountId"]
    end

    def spot_bnb_burn?
      body["spotBNBBurn"]
    end

  end
end
