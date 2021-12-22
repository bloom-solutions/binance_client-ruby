module BinanceClient
  class SubAccountDepositHistoryResponse < BaseResponse

    def deposits
      body.map do |deposit_hash|
        Deposit.new(raw_hash: deposit_hash)
      end
    end

  end
end
