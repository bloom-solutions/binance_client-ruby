require "spec_helper"

RSpec.describe "#all_orders", vcr: { record: :once } do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:sub_account_api_key],
      api_secret: CONFIG[:sub_account_api_secret]
    )
  end

  it "retrieves all orders within a timeframe" do
    response = client.all_orders("ETHUSDT", "1651298308000")

    expect(response).to be_success
    
    orders = response.orders
    order = orders.first
    
    aggregate_failures do
      expect(orders).to be_present
      expect(orders).to_not be_empty
      expect(order.order_id).to be_a(Integer)
      expect(order.executed_quantity).to be_a(String)
      expect(order.cummulative_quote_quantity).to be_a(String)
      expect(order.symbol).to be_a(String)
      expect(order.symbol).to be_a(String)
    end
  end
end
