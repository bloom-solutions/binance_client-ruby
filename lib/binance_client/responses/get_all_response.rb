module BinanceClient
  class GetAllResponse < BaseResponse
    attribute :body, Object, default: :default_body

    private

    def default_body
      payload = {}
      parsed_body = JSON.parse(raw_response.body)

      parsed_body.map do |coin_details|
        payload[coin_details["coin"]] = coin_details
      end

      payload
    end
  end
end
