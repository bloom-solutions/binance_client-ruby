require 'spec_helper'

module BinanceClient
  RSpec.describe AllOrdersResponse do

    let(:body) do
      [
        {
          "symbol"=>"ETHUSDT",
          "orderId"=>8848559626,
          "orderListId"=>-1,
          "clientOrderId"=>"web_5a1ebca8b224446993b0ca14abef4cf5",
          "price"=>"0.00000000",
          "origQty"=>"1.20000000",
          "executedQty"=>"1.20000000",
          "cummulativeQuoteQty"=>"2769.10800000",
          "status"=>"FILLED",
          "timeInForce"=>"GTC",
          "type"=>"MARKET",
          "side"=>"BUY",
          "stopPrice"=>"0.00000000",
          "icebergQty"=>"0.00000000",
          "time"=>1652148725960,
          "updateTime"=>1652148725960,
          "isWorking"=>true,
          "origQuoteOrderQty"=>"0.00000000",
        }
      ]
    end

    subject(:order) do
      described_class.new(body: body).orders.first
    end

    its(:symbol) { is_expected.to eq "ETHUSDT" }
    its(:executed_quantity) { is_expected.to eq "1.20000000" }
    its(:cummulative_quote_quantity) { is_expected.to eq "2769.10800000" }
    its(:order_id) { is_expected.to eq 8848559626 }
    its(:side) { is_expected.to eq "BUY" }

  end
end
