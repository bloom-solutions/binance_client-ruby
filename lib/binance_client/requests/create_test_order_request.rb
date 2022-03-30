module BinanceClient
  class CreateTestOrderRequest < AuthenticatedBaseRequest
    attribute :symbol, String
    attribute :side, String
    attribute :type, String
    attribute :quantity, String

    private

    def path
      "/api/v3/order/test"
    end

    def default_action
      :post
    end

    def params_without_signature
      {
        symbol: symbol,
        side: side,
        type: type,
        quantity: quantity,
      }
    end
  end
end
