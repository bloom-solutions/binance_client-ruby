module BinanceClient
  class OrderFill < BaseModel

    attribute :price, BigDecimal
    attribute :qty, BigDecimal
    attribute :commission, BigDecimal
    attribute :commission_asset, String
    attribute :trade_id, Integer

    def self.new_from_raw_hash(raw_hash)
      self.new(
        price: raw_hash["price"],
        qty: raw_hash["qty"],
        commission: raw_hash["commission"],
        commission_asset: raw_hash["commissionAsset"],
        trade_id: raw_hash["tradeId"],
      )
    end

  end
end
