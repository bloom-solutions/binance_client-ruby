require 'spec_helper'

module BinanceClient
  RSpec.describe Market do

    let(:json) do
      %Q(
        {
          "symbol": "ETHBTC",
          "status": "TRADING",
          "baseAsset": "ETH",
          "baseAssetPrecision": 8,
          "quoteAsset": "BTC",
          "quotePrecision": 8,
          "quoteAssetPrecision": 8,
          "baseCommissionPrecision": 8,
          "quoteCommissionPrecision": 8,
          "orderTypes": [
            "LIMIT",
            "LIMIT_MAKER",
            "MARKET",
            "STOP_LOSS_LIMIT",
            "TAKE_PROFIT_LIMIT"
          ],
          "icebergAllowed": true,
          "ocoAllowed": true,
          "quoteOrderQtyMarketAllowed": true,
          "isSpotTradingAllowed": true,
          "isMarginTradingAllowed": true,
          "filters": [
            {
              "filterType": "PRICE_FILTER",
              "minPrice": "0.00000100",
              "maxPrice": "922327.00000000",
              "tickSize": "0.00000100"
            },
            {
              "filterType": "PERCENT_PRICE",
              "multiplierUp": "5",
              "multiplierDown": "0.2",
              "avgPriceMins": 5
            },
            {
              "filterType": "LOT_SIZE",
              "minQty": "0.00010000",
              "maxQty": "100000.00000000",
              "stepSize": "0.00010000"
            },
            {
              "filterType": "MIN_NOTIONAL",
              "minNotional": "0.00010000",
              "applyToMarket": true,
              "avgPriceMins": 5
            },
            {
              "filterType": "ICEBERG_PARTS",
              "limit": 10
            },
            {
              "filterType": "MARKET_LOT_SIZE",
              "minQty": "0.00000000",
              "maxQty": "891.45118826",
              "stepSize": "0.00000000"
            },
            {
              "filterType": "MAX_NUM_ORDERS",
              "maxNumOrders": 200
            },
            {
              "filterType": "MAX_NUM_ALGO_ORDERS",
              "maxNumAlgoOrders": 5
            }
          ],
          "permissions": [
            "SPOT",
            "MARGIN"
          ]
        }
      )
    end
    let(:body) { JSON.parse(json) }
    subject(:market) { described_class.new(raw_hash: body) }

    its(:symbol) { is_expected.to eq "ETHBTC" }
    its(:status) { is_expected.to eq "TRADING" }
    its(:base_asset) { is_expected.to eq "ETH" }
    its(:base_asset_precision) { is_expected.to eq 8 }
    its(:quote_asset) { is_expected.to eq "BTC" }
    its(:quote_precision) { is_expected.to eq 8 }
    its(:quote_asset_precision) { is_expected.to eq 8 }
    its(:base_commission_precision) { is_expected.to eq 8 }
    its(:quote_commission_precision) { is_expected.to eq 8 }
    its(:order_types) do
      is_expected.to eq([
        "LIMIT",
        "LIMIT_MAKER",
        "MARKET",
        "STOP_LOSS_LIMIT",
        "TAKE_PROFIT_LIMIT"
      ])
    end
    its(:iceberg_allowed) { is_expected.to be true }
    its(:iceberg_allowed?) { is_expected.to be true }
    its(:oco_allowed) { is_expected.to be true }
    its(:oco_allowed?) { is_expected.to be true }
    its(:quote_order_qty_market_allowed) { is_expected.to be true }
    its(:quote_order_qty_market_allowed?) { is_expected.to be true }
    its(:is_spot_trading_allowed) { is_expected.to be true }
    its(:spot_trading_allowed?) { is_expected.to be true }
    its(:is_margin_trading_allowed) { is_expected.to be true }
    its(:margin_trading_allowed?) { is_expected.to be true }

    describe "#filters" do
      it "returns an array of MarketFilter objects" do
        market_filter = market.filters.first

        expect(market_filter.filter_type).to eq "PRICE_FILTER"
      end
    end

  end
end
