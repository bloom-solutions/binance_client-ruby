module BinanceClient
  class SubAccountDepositAddressResponse < BaseResponse

    def deposit_address
      DepositAddress.new(
        address: body["address"],
        coin: body["coin"],
        tag: body["tag"],
        url: body["url"],
      )
    end

  end
end
