module BinanceClient
  class OrderBook < BaseModel

    attribute :body, Hash
    attribute(:last_update_id, Integer, {
      lazy: true,
      default: :default_last_update_id,
    })

    def default_last_update_id
      body["lastUpdateId"]
    end

    def bids
      @bids ||= _entries_from(body["bids"])
    end

    def asks
      @asks ||= _entries_from(body["asks"])
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
