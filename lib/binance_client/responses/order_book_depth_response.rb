module BinanceClient
  class OrderBookDepthResponse < BaseResponse

    attribute(:order_book, BinanceClient::OrderBook, {
      lazy: true,
      default: :default_order_book,
    })

    def default_order_book
      OrderBook.new(body: body)
    end

  end
end
