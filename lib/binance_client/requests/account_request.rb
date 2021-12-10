module BinanceClient
  class AccountRequest < AuthenticatedBaseRequest
    private

    def path
      "/api/v3/account"
    end

  end
end
