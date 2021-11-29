RSpec.describe BinanceClient do
  it "has a version number" do
    expect(BinanceClient::VERSION).not_to be nil
  end

  it "has a proxy configuration" do
    BinanceClient.configuration.proxy = "https://myproxy"
    expect(BinanceClient.configuration.proxy).to eq "https://myproxy"
  end
end
