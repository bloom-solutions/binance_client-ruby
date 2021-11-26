module BinanceClient
  class AssetBalance

    attr_reader :asset

    def initialize(asset:, free:, locked:)
      @asset = asset
      @free = free
      @locked = locked
    end

    def free
      @free.to_d
    end

    def locked
      @locked.to_d
    end

  end
end
