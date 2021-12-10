require 'spec_helper'

module BinanceClient
  RSpec.describe AuthenticatedBaseRequest do

    it "does not sent recvWindow if it is nil" do
      # Binance will set it if we do not send it
      response = described_class.new(
        api_key: "hi",
        api_secret: "something",
        recv_window: nil,
      )
      params = response.params_without_signature_with_timestamp_and_recv_window

      expect(params).to_not have_key(:recvWindow)
    end

  end
end
