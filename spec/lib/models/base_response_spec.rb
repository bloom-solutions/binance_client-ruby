require 'spec_helper'

module BinanceClient
  RSpec.describe BaseResponse do

    describe "#used_weight(interval)" do
      context "used weight exists" do
        let(:raw_headers) do
          {
            "X-Mbx-Used-Weight-1m" => '1',
          }
        end
        let(:raw_response) do
          instance_double Typhoeus::Response, headers: raw_headers
        end
        let(:response) do
          described_class.new(raw_response: raw_response)
        end

        it "returns the used weight of the interval as an Integer" do
          expect(response.used_weight("1m")).to eq 1
        end
      end

      context "used weight does not exist" do
        let(:raw_headers) do
          {
            "X-Mbx-Used-Weight-1m" => '1',
          }
        end
        let(:raw_response) do
          instance_double Typhoeus::Response, headers: raw_headers
        end
        let(:response) do
          described_class.new(raw_response: raw_response)
        end

        it "returns the used weight of the interval as an Integer" do
          expect(response.used_weight("1h")).to be_nil
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
