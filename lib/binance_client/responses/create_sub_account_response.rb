module BinanceClient
  class CreateSubAccountResponse < BaseResponse

    attribute :sub_account_id, Integer, lazy: true, default: :default_sub_acccount_id
    attribute :email, String, lazy: true, default: :default_email

    def default_sub_acccount_id
      body["subaccountId"]
    end

    def default_email
      body["email"]
    end

  end
end
