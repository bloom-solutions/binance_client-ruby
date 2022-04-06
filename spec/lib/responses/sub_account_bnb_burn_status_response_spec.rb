require 'spec_helper'

module BinanceClient
  RSpec.describe SubAccountBnbBurnStatusResponse do

    describe "#spot_bnb_burn?" do
      let(:response) { described_class.new(body: {"spotBNBBurn" => true}) }

      it "the body's spotBNBBurn" do
        expect(response.spot_bnb_burn?).to be true
      end
    end

    describe "#spot_bnb_burn" do
      let(:response) { described_class.new(body: {"spotBNBBurn" => false}) }

      it "the body's spotBNBBurn" do
        expect(response.spot_bnb_burn).to be false
      end
    end

  end
end
