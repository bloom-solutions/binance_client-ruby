module BinanceClient
  class SubAccountDepositHistoryRequest < AuthenticatedBaseRequest
    attribute :sub_account_id, String
    attribute :start_time, DateTime
    attribute :end_time, DateTime
    attribute :coin, String
    attribute :status, Integer
    attribute :limit, Integer
    attribute :offset, Integer

    PARAMS = [
      :sub_account_id,
      :start_time,
      :end_time,
      :coin,
      :status,
      :limit,
      :offset,
    ].freeze

    private

    def path
      "/sapi/v1/broker/subAccount/depositHist"
    end

    def params_without_signature
      PARAMS.each_with_object({}) do |param, hash|
        key = param.to_s.camelcase(:lower)
        value = send(param)
        value = value.to_i * 1_000 if value.is_a?(DateTime)
        hash[key] = value
      end
    end
  end
end
