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

require "binance_client/loader"

BinanceClient::Loader.()

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
