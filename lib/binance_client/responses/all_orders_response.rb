module BinanceClient
  class AllOrdersResponse < BaseResponse
    def orders
      body.map do |hash|
        Order.new({
          symbol: hash["symbol"],
          executed_quantity: hash["executedQty"],
          cummulative_quote_quantity: hash["cummulativeQuoteQty"],
          order_id: hash["orderId"],
          side: hash["side"],
        })
      end
    end
  end
end
