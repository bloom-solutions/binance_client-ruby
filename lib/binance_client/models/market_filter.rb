module BinanceClient
  class MarketFilter

    attr_reader :raw_hash

    def initialize(raw_hash:)
      @raw_hash = raw_hash
    end

    def method_missing(method_name, *args)
      key = method_name.to_s.camelcase(:lower)
      super if raw_hash[key].nil?

      self.class.define_method method_name do
        value = raw_hash[method_name.to_s.camelcase(:lower)]

        value = value.to_d if value =~ /^[\d\.]+$/

        value
      end
      send(method_name)
    end

  end
end
