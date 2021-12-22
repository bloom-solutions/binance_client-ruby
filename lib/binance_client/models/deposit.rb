module BinanceClient
  class Deposit

    METHODS = %i[
      sub_account_id
      address
      address_tag
      amount
      coin
      network
      status
      tx_id
      source_address
      confirm_times
    ].freeze

    attr_reader :raw_hash

    def initialize(raw_hash:)
      @raw_hash = raw_hash
    end

    METHODS.each do |method_name|
      define_method method_name do
        raw_hash[method_name.to_s.camelcase(:lower)]
      end
    end

    def insert_time
      Time.at(raw_hash["insertTime"] / 1_000)
    end

  end
end
