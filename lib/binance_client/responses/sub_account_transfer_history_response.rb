module BinanceClient
  class SubAccountTransferHistoryResponse < BaseResponse

    def transfers
      @transfers ||= body.map do |hash|
        Transfer.new(raw_hash: hash)
      end
    end

  end
end
