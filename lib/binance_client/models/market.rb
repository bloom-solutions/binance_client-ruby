module BinanceClient
  class Market < BaseModel

    METHODS = %i[
      symbol
      status
      base_asset
      base_asset_precision
      quote_asset
      quote_precision
      quote_asset_precision
      base_commission_precision
      quote_commission_precision
      order_types
      iceberg_allowed
      oco_allowed
      quote_order_qty_market_allowed
      is_spot_trading_allowed
      is_margin_trading_allowed
    ].freeze

    BOOL_MAP = {
      iceberg_allowed: :iceberg_allowed?,
      oco_allowed: :oco_allowed?,
      quote_order_qty_market_allowed: :quote_order_qty_market_allowed?,
      is_spot_trading_allowed: :spot_trading_allowed?,
      is_margin_trading_allowed: :margin_trading_allowed?,
    }.freeze

    attr_reader :raw_hash

    def initialize(raw_hash:)
      @raw_hash = raw_hash
    end

    METHODS.each do |method_name|
      define_method method_name do
        raw_hash[method_name.to_s.camelcase(:lower)]
      end
    end

    BOOL_MAP.each do |original_method_name, alias_method_name|
      alias_method alias_method_name, original_method_name
    end

    def filters
      @filters ||= raw_hash["filters"].map do |filter_hash|
        MarketFilter.new(raw_hash: filter_hash)
      end
    end

  end
end
