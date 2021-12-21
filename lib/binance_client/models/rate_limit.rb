module BinanceClient
  class RateLimit

    METHODS = %i[
      rate_limit_type
      interval
      interval_num
      limit
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

  end
end
