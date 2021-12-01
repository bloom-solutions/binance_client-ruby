module BinanceClient
  class DepositAddress

    def self.new_from_raw(raw_hash)
      args = raw_hash.each_with_object({}) do |(k, v), h|
        h[k.underscore] = v
      end

      self.new(**args)
    end

    ATTRS = [
      :address,
      :coin,
      :tag,
      :url,
    ]

    attr_accessor(*ATTRS)

    def initialize(**kwargs)
      kwargs.each do |attr, value|
        self.send("#{attr}=", value)
      end
    end

  end
end
