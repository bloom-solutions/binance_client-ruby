module BinanceClient
  class ExchangeInfoRequest < BaseRequest
    private

    def path
      "api/v1/exchangeInfo"
    end

  end
end
