module BinanceClient
  class OrderBookEntry < BaseModel

    attribute :price, BigDecimal
    attribute :quantity, BigDecimal

  end
end
