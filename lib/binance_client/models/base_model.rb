module BinanceClient
  class BaseModel

    include Virtus.model

    private

    def memoize_results(key)
      return instance_variable_get(key) if instance_variable_defined?(key)
      instance_variable_set key, yield
    end

  end
end
