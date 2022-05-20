module BinanceClient
  class Order
    attr_reader :symbol
    attr_reader :executed_quantity
    attr_reader :cummulative_quote_quantity
    attr_reader :order_id
    attr_reader :side

    def initialize(
      symbol:,
      executed_quantity:,
      cummulative_quote_quantity:,
      order_id:,
      side:
    )
      @symbol = symbol
      @executed_quantity = executed_quantity
      @cummulative_quote_quantity = cummulative_quote_quantity
      @order_id = order_id
      @side = side
    end
  end
end
