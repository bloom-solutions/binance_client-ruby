module BinanceClient
  class SubAccountsResponse < BaseResponse

    attribute(:sub_accounts, Array[BinanceClient::Account], {
      lazy: true,
      default: :default_sub_accounts,
    })

    def default_sub_accounts
      body.map do |sub_account_hash|
        Account.new(raw_hash: sub_account_hash)
      end
    end

  end
end
