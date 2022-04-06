module BinanceClient
  class WithdrawResponse < BaseResponse

    attribute :withdrawal_id, String, lazy: true, default: :default_withdrawal_id

    private

    def default_withdrawal_id
      body["id"]
    end

  end
end
