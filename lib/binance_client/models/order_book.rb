module BinanceClient
  class OrderBook < BaseModel

    attribute :body, Hash
    attribute(:last_update_id, Integer, {
      lazy: true,
      default: :default_last_update_id,
    })
    attribute(:bids, Array[BinanceClient::OrderBookEntry], {
      lazy: true,
      default: :default_bids,
    })
    attribute(:asks, Array[BinanceClient::OrderBookEntry], {
      lazy: true,
      default: :default_asks,
    })

    def default_last_update_id
      body["lastUpdateId"]
    end

    def default_bids
      _entries_from body["bids"]
    end

    def default_asks
      _entries_from body["asks"]
    end

    private

    def _entries_from(array)
      array.map do |raw_entry|
        price, quantity = raw_entry
        OrderBookEntry.new(price: price, quantity: quantity)
      end
    end

  end
end
