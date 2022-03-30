module BinanceClient
  class Client
    include APIClientBase::Client.module(default_opts: :default_opts)

    api_action :account
    api_action :system_status
    api_action :account_snapshot
    api_action :coins_info
    api_action :exchange_info
    api_action :book_ticker
    api_action :order_book_depth
    api_action :sub_account_assets, args: [:email]
    api_action :sub_account_deposit_address
    api_action :sub_account_deposit_history
    api_action :sub_account_bnb_burn_status, args: [:sub_account_id]
    api_action(:sub_account_set_spot_bnb_burn, {
      args: [:sub_account_id, :spot_bnb_burn_status],
    })
    api_action :create_sub_account
    api_action :sub_account_transfer
    api_action :sub_account_create_api_keys
    api_action :create_test_order
    api_action :create_order

    attribute :host
    attribute :api_key
    attribute :api_secret
    attribute :proxy
    attribute :recv_window

    private

    def default_opts
      {
        host: host,
        api_key: api_key,
        api_secret: api_secret,
        proxy: proxy,
        recv_window: recv_window,
      }
    end
  end
end
