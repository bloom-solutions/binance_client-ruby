module BinanceClient
  class SubAccountCreateApiKeysRequest < AuthenticatedBaseRequest
    attribute :sub_account_id
    attribute :can_trade, Boolean, default: true
    attribute :margin_trade, Boolean, default: false
    attribute :futures_trade, Boolean, default: false

    private

    def path
      "/sapi/v1/broker/subAccountApi"
    end

    def default_action
      :post
    end

    def params_without_signature
      {
        subAccountId: sub_account_id,
        canTrade: can_trade,
        marginTrade: margin_trade,
        futuresTrade: futures_trade,
      }
    end
  end
end
