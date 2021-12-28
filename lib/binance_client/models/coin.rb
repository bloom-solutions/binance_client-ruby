module BinanceClient
  class Coin < BaseModel

    STR_METHODS = %i[
      coin
      name
    ].freeze

    DECIMAL_METHODS = %i[
      free
      freeze
      ipoable
      ipoing
      locked
      storage
      withdrawing
    ].freeze

    BOOL_MAP = {
      deposit_all_enable: :deposit_all_enabled?,
      is_legal_money: :legal_money?,
      trading: :trading?,
      withdraw_all_enable: :withdraw_all_enabled?,
    }.freeze

    METHODS = (STR_METHODS + DECIMAL_METHODS + BOOL_MAP.keys).freeze

    attr_accessor :raw_hash
    attr_writer *METHODS

    def initialize(**kwargs)
      kwargs.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    STR_METHODS.each do |method_name|
      define_method method_name do
        memoize_results "@#{method_name}" do
          raw_hash[method_name.to_s.camelcase(:lower)]
        end
      end
    end

    DECIMAL_METHODS.each do |method_name|
      define_method method_name do
        memoize_results "@#{method_name}" do
          raw_hash[method_name.to_s.camelcase(:lower)].to_d
        end
      end
    end

    BOOL_MAP.each do |original_method_name, alias_method_name|
      define_method original_method_name do
        memoize_results "@#{original_method_name}" do
          raw_hash[original_method_name.to_s.camelcase(:lower)]
        end
      end

      alias_method alias_method_name, original_method_name
    end

    def network_list
      @network_list ||= raw_hash["networkList"].map do |network_hash|
        Network.new(raw_hash: network_hash)
      end
    end

  end
end
