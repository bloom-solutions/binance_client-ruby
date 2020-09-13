module BinanceClient
  class Client
    include APIClientBase::Client.module(default_opts: :default_opts)

    api_action :system_status
    api_action :account_snapshot

    attribute :host
    attribute :api_key
    attribute :api_secret

    private

    def default_opts
      {host: host, api_key: api_key, api_secret: api_secret}
    end
  end
end
