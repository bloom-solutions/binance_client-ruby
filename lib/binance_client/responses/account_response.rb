module BinanceClient
  class AccountResponse < BaseResponse

    [
      :maker_commission,
      :taker_commission,
      :buyer_commission,
      :seller_commission,
      :can_trade,
      :can_withdraw,
      :can_deposit,
      :update_time,
      :account_type,
      :permissions,
    ].each do |method_name|
      define_method method_name do
        key = method_name.to_s.camelcase(:lower)
        body[key]
      end
    end

    def balances
      body["balances"].map do |balance_hash|
        AssetBalance.new(**balance_hash.symbolize_keys)
      end
    end

  end
end
