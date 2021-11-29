require "spec_helper"

RSpec.describe "Proxy support", vcr: {record: :once} do
  let(:after_response_hook) do
    ->(request, response) do
      $proxy = request.proxy
    end
  end
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      proxy: CONFIG[:proxy],
    )
  end

  before do
    BinanceClient.configuration.after_response = after_response_hook
  end

  it "uses the proxy" do
    response = client.book_ticker(symbol: "BTCUSDT")

    # Don't know how to check for proxy usage any other way, so just ensure
    # the request has it defined properly since APIClientBase just takes it
    # and makes the call via Tphoeus
    expect($proxy).to eq CONFIG[:proxy]
  end

  after do
    $proxy = nil
  end
end
