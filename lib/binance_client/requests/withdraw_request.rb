module BinanceClient
  class WithdrawRequest < AuthenticatedBaseRequest

    attribute :coin, String
    attribute :address, String
    attribute :amount, Float
    attribute :withdraw_order_id, String
    attribute :network, String
    attribute :address_tag, String
    attribute :transaction_fee_flag, Boolean
    attribute :name, String
    attribute :wallet_type, Integer

    private

    def escaped_name
      return nil if name.blank?
      name.gsub("\s", "%20")
    end

    def path
      "/sapi/v1/capital/withdraw/apply"
    end

    def default_action
      :post
    end

    def params_without_signature
      {
        coin: coin,
        address: address,
        amount: amount,
        withdrawOrderId: withdraw_order_id,
        network: network,
        addressTag: address_tag,
        transactionFeeFlag: transaction_fee_flag,
        name: escaped_name,
        walletType: wallet_type,
      }.reject do |key, value|
        value.blank?
      end
    end

  end
end
