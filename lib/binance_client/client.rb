module BinanceClient
  class Client
    include APIClientBase::Client.module(default_opts: :default_opts)

    api_action :system_status
    api_action :account_snapshot
    api_action :get_all
    api_action :book_ticker
    api_action :order_book_depth
    api_action :sub_account_assets, args: [:email]

    attribute :host
    attribute :api_key
    attribute :api_secret
    attribute :proxy

    private

    def default_opts
      {host: host, api_key: api_key, api_secret: api_secret, proxy: proxy}
    end
  end
end
