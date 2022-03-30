module BinanceClient
  class CreateTestOrderRequest < BaseCreateOrderRequest

    private

    def path
      "/api/v3/order/test"
    end

  end
end
