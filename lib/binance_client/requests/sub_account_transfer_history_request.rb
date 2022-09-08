module BinanceClient
  class SubAccountTransferHistoryRequest < AuthenticatedBaseRequest

    attribute :from_id, String
    attribute :to_id, String
    attribute :client_tran_id, String
    attribute :show_all_status, Boolean
    attribute :start_time, Integer
    attribute :end_time, Integer
    attribute :page, Integer
    attribute :limit, Integer

    def start_time=(datetime)
      return if datetime.nil?
      @start_time = datetime.to_i * 1_000
    end

    def end_time=(datetime)
      return if datetime.nil?
      @end_time = datetime.to_i * 1_000
    end

    private

    def path
      "/sapi/v1/broker/transfer"
    end

    def default_action
      :get
    end

    def params_without_signature
      %i[
        fromId
        toId
        clientTranId
        showAllStatus
        startTime
        endTime
        page
        limit
      ].each_with_object({}) do |attr, hash|
        val = send(attr.to_s.underscore)

        next if val.nil?

        hash[attr] = val
      end
    end
  end
end
