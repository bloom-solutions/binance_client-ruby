require 'spec_helper'

module BinanceClient
  RSpec.describe CreateOrderResponse do

    let(:body) do
      {
        "symbol" => "BTCUSDT",
        "orderId" => 10015235689,
        "orderListId" => -1,
        "clientOrderId" => "OC38pAedB7n9H2L2k422gY",
        "transactTime" => 1648633455661,
        "price" => "0.00000000",
        "origQty" => "0.00050000",
        "executedQty" => "0.00050000",
        "cummulativeQuoteQty" => "23.62969000",
        "status" => "FILLED",
        "timeInForce" => "GTC",
        "type" => "MARKET",
        "side" => "SELL",
        "fills" => [
          "price" => "47259.38000000",
          "qty" => "0.00050000",
          "commission" => "0.02362969",
          "commissionAsset" => "USDT",
          "tradeId" => 1309526354
        ]
      }
    end
    subject(:response) { described_class.new(body: body) }

    its(:symbol) { is_expected.to eq "BTCUSDT" }
    its(:order_id) { is_expected.to eq 10015235689 }
    its(:order_list_id) { -1 }
    its(:client_order_id) { "OC38pAedB7n9H2L2k422gY" }
    its(:transact_time) { 1648633455661 }
    its(:price) { 0.0 }
    its(:origQty) { 0.0005 }
    its(:executedQty) { 0.0005 }
    its(:cummulativeQuoteQty) { 23.62969 }
    its(:status) { "FILLED" }
    its(:timeInForce) { "GTC" }
    its(:type) { "MARKET" }
    its(:side) { "SELL" }

    describe "#fills" do
      let(:fills) { response.fills }

      it "reflects the fills" do
        expect(fills.count).to eq 1

        fill = fills.first

        expect(fill.price).to eq 47259.38
        expect(fill.qty).to eq 0.0005
        expect(fill.commission).to eq 0.02362969
        expect(fill.commission_asset).to eq "USDT"
        expect(fill.trade_id).to eq 1309526354
      end
    end

  end
end
