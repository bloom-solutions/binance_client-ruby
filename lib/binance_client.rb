require "binance_client/version"
require "api_client_base"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/to_query"
require "json"
require "openssl"

require "binance_client/client"

require "binance_client/requests/base_request"
require "binance_client/responses/base_response"
require "binance_client/requests/system_status_request"
require "binance_client/requests/account_snapshot_request"
require "binance_client/requests/get_all_request"
require "binance_client/requests/book_ticker_request"
require "binance_client/responses/system_status_response"
require "binance_client/responses/account_snapshot_response"
require "binance_client/responses/get_all_response"
require "binance_client/responses/book_ticker_response"

module BinanceClient
  class Error < StandardError; end

  include APIClientBase::Base.module

  DEFAULT_HOST = "https://api.binance.com"

  with_configuration do
    has :host, classes: String, default: DEFAULT_HOST
    has :api_key, classes: String
    has :api_secret, classes: String
  end
end
