require 'spec_helper'

module BinanceClient
  RSpec.describe DepositAddress do

    describe ".new_from_raw" do
      let(:raw_hash) do
        {
          "address" => "TDunhSa7jkTNuKrusUTU1MUHtqXoBPKETV",
          "coin" => "USDT",
          "tag" => "test",
          "url" => "https://tronscan.org/#/address/TDunhSa7jkTNuKrusUTU1MUHtqXoBPKETV"
        }
      end
      let(:deposit_address) { described_class.new_from_raw(raw_hash) }

      it "properly sets the attributes" do
        aggregate_failures do
          expect(deposit_address.address).
            to eq "TDunhSa7jkTNuKrusUTU1MUHtqXoBPKETV"
          expect(deposit_address.coin).to eq "USDT"
          expect(deposit_address.tag).to eq "test"
          expect(deposit_address.url).
            to eq "https://tronscan.org/#/address/TDunhSa7jkTNuKrusUTU1MUHtqXoBPKETV"
        end
      end
    end

  end
end
