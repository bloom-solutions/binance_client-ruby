module BinanceClient
  class CreateTestOrderResponse < BaseResponse

    attribute :symbol, String, lazy: true, default: :default_symbol
    attribute :order_id, Integer, lazy: true, default: :default_order_id
    attribute :client_order_id, String, lazy: true, default: :default_client_order_id
    attribute :transact_time, Integer, lazy: true, default: :default_transact_time
    attribute :price, BigDecimal, lazy: true, default: :default_price
    attribute :orig_qty, BigDecimal, lazy: true, default: :default_orig_qty
    attribute :executed_qty, BigDecimal, lazy: true, default: :default_executed_qty
    attribute :cummulative_quote_qty, BigDecimal, lazy: true, default: :default_cummulative_quote_qty
    attribute :status, String, lazy: true, default: :default_status
    attribute :time_in_force, String, lazy: true, default: :default_time_in_force
    attribute :type, String, lazy: true, default: :default_type
    attribute :side, String, lazy: true, default: :default_side
    attribute :time_in_force, String, lazy: true, default: :default_time_in_force
    attribute :type, String, lazy: true, default: :default_type
    attribute :side, String, lazy: true, default: :default_side

    private

    {
      symbol: :symbol,
      order_id: :orderId,
      client_order_id: :clientOrderId,
      transact_time: :transactTime,
      price: :price,
      orig_qty: :origQty,
      executed_qty: :executedQty,
      cummulative_quote_qty: :cummulativeQuoteQty,
      status: :status,
      time_in_force: :timeInForce,
      type: :type,
      side: :side,
    }.each do |attr, remote_attr|
      define_method :"default_#{attr}" do
        body[remote_attr.to_s]
      end
    end

  end
end
