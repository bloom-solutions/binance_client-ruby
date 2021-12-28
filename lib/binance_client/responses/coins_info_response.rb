module BinanceClient
  class CoinsInfoResponse < BaseResponse

    def coins
      @coins ||= body.map do |coin_hash|
        Coin.new(raw_hash: coin_hash)
      end
    end

  end
end
