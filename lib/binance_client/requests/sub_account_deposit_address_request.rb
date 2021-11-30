module BinanceClient
  class SubAccountDepositAddressRequest < AuthenticatedBaseRequest

    attribute :email, String
    attribute :coin, String
    attribute :network, String

    private

    def path
      "/sapi/v1/capital/deposit/subAddress"
    end

    def params_without_signature
      {
        email: email,
        coin: coin,
        network: network,
      }.reject do |key, value|
        value.nil?
      end
    end

  end
end
