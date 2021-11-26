module BinanceClient
  class SubAccountAssetsResponse < BaseResponse

    attribute(:balances, Array[BinanceClient::AssetBalance], {
      lazy: true,
      default: :default_balances,
    })

    def default_balances
      body["balances"].map do |balance_hash|
        AssetBalance.new(**balance_hash.symbolize_keys)
      end
    end

  end
end
