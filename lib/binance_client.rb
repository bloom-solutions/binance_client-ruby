require "binance_client/version"
require "api_client_base"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/to_query"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/date_time"
require "active_support/core_ext/integer"
require "json"
require "openssl"

require "binance_client/client"

require "binance_client/models/base_model"
require "binance_client/models/order_book_entry"
require "binance_client/models/order_book"
require "binance_client/models/asset_balance"
require "binance_client/models/deposit_address"
require "binance_client/models/market"
require "binance_client/models/market_filter"
require "binance_client/models/rate_limit"
require "binance_client/models/deposit"
require "binance_client/models/network"
require "binance_client/models/coin"

require "binance_client/requests/base_request"
require "binance_client/requests/authenticated_base_request"
require "binance_client/responses/base_response"
require "binance_client/requests/system_status_request"
require "binance_client/requests/account_snapshot_request"
require "binance_client/requests/exchange_info_request"
require "binance_client/requests/coins_info_request"
require "binance_client/requests/book_ticker_request"
require "binance_client/requests/order_book_depth_request"
require "binance_client/requests/sub_account_assets_request"
require "binance_client/requests/sub_account_deposit_address_request"
require "binance_client/requests/sub_account_deposit_history_request"
require "binance_client/requests/sub_account_bnb_burn_status_request"
require "binance_client/requests/sub_account_set_bnb_burn_status_request"
require "binance_client/requests/account_request"
require "binance_client/responses/system_status_response"
require "binance_client/responses/account_snapshot_response"
require "binance_client/responses/coins_info_response"
require "binance_client/responses/exchange_info_response"
require "binance_client/responses/book_ticker_response"
require "binance_client/responses/order_book_depth_response"
require "binance_client/responses/sub_account_assets_response"
require "binance_client/responses/sub_account_deposit_address_response"
require "binance_client/responses/sub_account_deposit_history_response"
require "binance_client/responses/sub_account_bnb_burn_status_response"
require "binance_client/responses/sub_account_set_bnb_burn_status_response"
require "binance_client/responses/account_response"

module BinanceClient
  class Error < StandardError; end

  include APIClientBase::Base.module

  DEFAULT_HOST = "https://api.binance.com"

  with_configuration do
    has :host, classes: String, default: DEFAULT_HOST
    has :api_key, classes: String
    has :api_secret, classes: String
    has :recv_window, classes: [NilClass, Integer]
    has :proxy
  end
end
