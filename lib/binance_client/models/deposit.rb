module BinanceClient
  class Deposit < BaseModel

    METHODS = %i[
      address
      address_tag
      amount
      coin
      network
      status
      tx_id
      source_address
      confirm_times
      insert_time
    ].freeze

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

    def sub_account_id
      raw_hash["subAccountId"].to_i
    end

    def insert_time
      @insert_time ||= Time.at(raw_hash["insertTime"] / 1_000)
    end

  end
end
