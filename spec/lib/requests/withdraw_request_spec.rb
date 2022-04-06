require 'spec_helper'

module BinanceClient
  RSpec.describe WithdrawRequest do

    describe "#params" do
      context "with all options" do
        let(:request) do
          described_class.new(
            api_key: CONFIG[:api_key],
            api_secret: CONFIG[:api_secret],
            coin: "BTC",
            address: "abcdefg",
            address_tag: "addrTag",
            amount: 0.0012,
            withdraw_order_id: "23",
            network: "NETW",
            transaction_fee_flag: true,
            name: "Special name yay",
            wallet_type: 0,
          )
        end
        subject(:params) { request.params }

        it "builds parameters" do
          aggregate_failures do
            expect(params).to include("coin=BTC")
            expect(params).to include("address=abcdefg")
            expect(params).to include("amount=0.0012")
            expect(params).to include("withdrawOrderId=23")
            expect(params).to include("network=NETW")
            expect(params).to include("addressTag=addrTag")
            expect(params).to include("transactionFeeFlag=true")

            # Binance asks to encode spaces as %20, and when you do that plus
            # escape for form submission, you get %2520
            expect(params).to include("name=Special%2520name%2520yay")

            expect(params).to include("walletType=0")
          end
        end
      end

      context "with some options" do
        let(:request) do
          described_class.new(
            api_key: CONFIG[:api_key],
            api_secret: CONFIG[:api_secret],
            coin: "BTC",
            address: "abcdefg",
            amount: 0.0012,
          )
        end
        subject(:params) { request.params }

        it "excludes blank params" do
          aggregate_failures do
            expect(params).to_not include("withdrawOrderId=")
            expect(params).to_not include("network=")
            expect(params).to_not include("addressTag=")
            expect(params).to_not include("transactionFeeFlag=")
            expect(params).to_not include("name=")
            expect(params).to_not include("walletType=")
          end
        end
      end
    end

  end
end
