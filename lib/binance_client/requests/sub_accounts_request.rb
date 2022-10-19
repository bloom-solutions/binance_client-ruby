module BinanceClient
  class SubAccountsRequest < AuthenticatedBaseRequest

    attribute :sub_account_id, Integer
    attribute :page, Integer
    attribute :size, Integer

    private

    def path
      "/sapi/v1/broker/subAccount"
    end

    def params_without_signature
      %i[sub_account_id page size].each_with_object({}) do |attr, hash|
        hash[attr.to_s.camelcase(:lower)] = send(attr)
      end
    end

  end
end
