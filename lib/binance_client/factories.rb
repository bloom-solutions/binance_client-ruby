FactoryBot.define do

  factory :binance_client_asset_balance, class: "BinanceClient::AssetBalance" do
    sequence(:asset) { |n| "ASSET#{n}" }
    free { rand(10_000) }
    locked { rand(1_000) }

    initialize_with do
      new(asset: asset, free: free, locked: locked)
    end
  end

  factory :binance_client_deposit, class: "BinanceClient::Deposit" do
    sequence(:sub_account_id) { |n| n.to_s }
    sequence(:address) { |n| "address#{n}" }
    sequence(:address_tag) { |n| "address_tag#{n}" }
    sequence(:amount) { |n| n * 10 }
    sequence(:coin) { |n| "coin#{n}" }
    sequence(:insert_time) { |n| Time.now }
    sequence(:network) { |n| "network#{n}" }
    sequence(:status) { |n| "status#{n}" }
    sequence(:tx_id) { |n| "tx_id#{n}" }
    sequence(:source_address) { |n| "source_address#{n}" }
    sequence(:confirm_times) { |n| "#{n}/#{n}" }
  end

  factory :binance_client_rate_limit, class: "BinanceClient::RateLimit" do
    rate_limit_type { "REQUEST_WEIGHT" }
    interval { %w[SECOND MINUTE DAY].sample }
    sequence(:interval_num) { |n| n }
    sequence(:limit) { |n| n }
  end

end
