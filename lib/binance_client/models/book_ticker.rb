module BinanceClient
  class BookTicker < BaseModel

    ATTRIBUTES = [
      :symbol,
      :bid_price,
      :bid_qty,
      :ask_price,
      :ask_qty
    ].freeze

    attribute :symbol, String
    attribute :bid_price, BigDecimal
    attribute :bid_qty, BigDecimal
    attribute :ask_price, BigDecimal
    attribute :ask_qty, BigDecimal

    def self.new_from_raw_hash(raw_hash)
      attrs = ATTRIBUTES.each_with_object({}) do |local_attr, hash|
        hash[local_attr] = raw_hash[local_attr.to_s.camelcase(:lower)]
      end
      self.new(attrs)
    end

  end
end
