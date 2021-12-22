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

    attr_accessor :raw_hash
    attr_writer *METHODS

    def initialize(**kwargs)
      kwargs.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    METHODS.each do |method_name|
      define_method method_name do
        memoize_results "@#{method_name}" do
          raw_hash[method_name.to_s.camelcase(:lower)]
        end
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
