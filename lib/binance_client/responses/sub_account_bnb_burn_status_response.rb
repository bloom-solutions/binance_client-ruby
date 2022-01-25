module BinanceClient
  class SubAccountBnbBurnStatusResponse < BaseResponse

    def sub_account_id
      body["subAccountId"]
    end

    def spot_bnb_burn?
      body["spotBNBBurn"]
    end

    def interest_bnb_burn?
      body["interestBNBBurn"]
    end

  end
end
