require 'spec_helper'

module BinanceClient
  RSpec.describe ExchangeInfoResponse do

    let(:json) do
      %Q(
        {
          "timezone": "UTC",
          "serverTime": 1640069257296,
          "rateLimits": [
            {
              "rateLimitType": "REQUEST_WEIGHT",
              "interval": "MINUTE",
              "intervalNum": 1,
              "limit": 1200
            }
          ],
          "exchangeFilters": [],
          "symbols": [
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
                }
              ],
              "permissions": [
                "SPOT",
                "MARGIN"
              ]
            }
          ]
        }
      )
    end
    let(:body) { JSON.parse(json) }
    subject(:response) { described_class.new(body: body) }

    its(:timezone) { is_expected.to eq "UTC" }
    its(:server_time) { is_expected.to eq 1640069257296 }

    describe "#rate_limits" do
      it "returns an array of rate limits" do
        rate_limit = response.rate_limits.first
        expect(rate_limit.rate_limit_type).to eq "REQUEST_WEIGHT"
      end
    end

    describe "#symbols" do
      it "returns an array of Market" do
        market = response.symbols.first
        expect(market.symbol).to eq "ETHBTC"
      end
    end

  end
end
