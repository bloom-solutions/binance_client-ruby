module BinanceClient
  class SubAccountBnbBurnStatusResponse < BaseResponse

    def spot_bnb_burn
      !!body["spotBNBBurn"]
    end
    alias_method :spot_bnb_burn?, :spot_bnb_burn

  end
end
