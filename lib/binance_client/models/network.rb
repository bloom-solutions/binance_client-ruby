module BinanceClient
  class Network < BaseModel

    METHODS = %i[
      address_regex
      coin
      deposit_desc
      deposit_enable
      is_default
      memo_regex
      min_confirm
      name
      network
      reset_address_status
      special_tips
      un_lock_confirm
      withdraw_desc
      withdraw_enable
      withdraw_fee
      withdraw_integer_multiple
      withdraw_max
      withdraw_min
      same_address
    ]

    BOOL_MAP = {
      deposit_enable: :deposit_enabled?,
      is_default: :default?,
      reset_address_status: :reset_address_status?,
      withdraw_enable: :withdraw_enabled?,
      same_address: :same_address?
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

  end
end
