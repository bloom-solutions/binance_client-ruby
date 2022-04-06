module BinanceClient
  class SubAccountCreateApiKeysResponse < BaseResponse

    attribute :sub_account_id, Integer, lazy: true, default: :default_sub_account_id
    attribute :api_key, String, lazy: true, default: :default_api_key
    attribute :secret_key, String, lazy: true, default: :default_secret_key
    attribute :can_trade, Boolean, lazy: true, default: :default_can_trade
    attribute :margin_trade, Boolean, lazy: true, default: :default_margin_trade
    attribute :futures_trade, Boolean, lazy: true, default: :default_futures_trade

    private

    {
      sub_account_id: :subaccountId,
      api_key: :apiKey,
      secret_key: :secretKey,
      can_trade: :canTrade,
      margin_trade: :marginTrade,
      futures_trade: :futuresTrade,
    }.each do |attr, remote_attr|
      define_method :"default_#{attr}" do
        body[remote_attr.to_s]
      end
    end

  end
end
