require 'spec_helper'

module BinanceClient
  RSpec.describe BaseResponse do

    describe "#used_weights" do
      context "used weight exists" do
        let(:raw_headers) do
          {
            "X-Mbx-Used-Weight-1d" => '100',
            "X-Mbx-Used-Weight-1m" => '1',
            "X-SAPI-USED-IP-WEIGHT-1M" => "10",
            "Another-Header" => "ABC",
          }
        end
        let(:raw_response) do
          instance_double Typhoeus::Response, headers: raw_headers
        end
        let(:response) do
          described_class.new(raw_response: raw_response)
        end

        it "returns all the used weights" do
          expect(response.used_weights).to eq({
            "X-MBX-USED-WEIGHT-1D" => '100',
            "X-MBX-USED-WEIGHT-1M" => '1',
            "X-SAPI-USED-IP-WEIGHT-1M" => "10",
          })
        end
      end
    end

    describe "#body_code" do
      let(:response) { described_class.new(body: body) }

      context "code exists" do
        let(:body) { {"code" => "-321"} }

        it "returns the value of 'code' as Integer" do
          expect(response.body_code).to eq -321
        end
      end

      context "code does not exist" do
        let(:body) { {} }

        it "returns the value of 'code' as Integer" do
          expect(response.body_code).to be_nil
        end
      end
    end

    describe "#message" do
      let(:response) { described_class.new(body: body) }

      let(:body) { {"message" => "Hi there"} }

      it "returns the value of 'message'" do
        expect(response.message).to eq "Hi there"
      end
    end

  end
end
