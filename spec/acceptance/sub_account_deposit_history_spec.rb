require "spec_helper"

RSpec.describe "#sub_account_deposit_history", vcr: {record: :once} do
  let(:client) do
    BinanceClient.new(
      host: CONFIG[:host],
      api_key: CONFIG[:api_key],
      api_secret: CONFIG[:api_secret],
      recv_window: 6_000,
    )
  end
  let(:start_time) do
    CONFIG[:sub_account_deposit_window_start]
  end
  let(:end_time) { start_time + 6.days }

  context "given no sub_account_id" do
    it "returns the all sub-account deposit history" do
      response = client.sub_account_deposit_history(
        start_time: start_time,
        end_time: end_time,
      )
      expect(response).to be_success

      deposits = response.deposits

      expect(deposits).to be_an Array
      expect(deposits).to be_present

      deposit = deposits.sample
      aggregate_failures do
        expect(deposit.sub_account_id).to be_an Integer
        expect(deposit.status).to be_a Integer
      end
    end
  end

  context "given a sub_account_id" do
    it "returns the that sub-account's deposit history" do
      response = client.sub_account_deposit_history(
        sub_account_id: CONFIG[:sub_account_id],
        start_time: start_time,
        end_time: end_time,
      )
      expect(response).to be_success

      deposits = response.deposits

      expect(deposits).to be_an Array
      expect(deposits).to be_present

      # Deposits may not actually have any deposit of other sub accounts
      # This isn't a good test because it'll be true whether or not we
      # correctly send the sub_account_id in the request
      expect(deposits.map(&:sub_account_id).uniq).
        to match_array([CONFIG[:sub_account_id]])

      deposit = deposits.sample
      aggregate_failures do
        expect(deposit.sub_account_id).to be_an Integer
        expect(deposit.status).to be_a Integer
      end
    end
  end
end
