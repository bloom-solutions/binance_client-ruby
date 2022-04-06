module BinanceClient
  class CreateOrderRequest < BaseCreateOrderRequest

    private

    def path
      "/api/v3/order"
    end

  end
end
