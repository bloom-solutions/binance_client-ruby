module BinanceClient
  class RateLimit < BaseModel

    INTERVALS = %w[SECOND MINUTE DAY].freeze
    METHODS = %i[
      rate_limit_type
      interval
      interval_num
      limit
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
        memoize_results("@#{method_name}") do
          raw_hash[method_name.to_s.camelcase(:lower)]
        end
      end
    end

    INTERVALS.each do |interval|
      define_method "#{interval.downcase}?" do
        interval == self.interval
      end
    end

  end
end
