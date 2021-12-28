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

  factory :binance_client_coin, class: "BinanceClient::Coin" do
    sequence(:coin) { |n| "ASSET#{n}" }
    sequence(:name) { |n| "Asset #{n}" }
    free { 0.001 }
    freeze { 0.001 }
    ipoable { 0.002 }
    ipoing { 0.003 }
    locked { 0.004 }
    storage { 0.005 }
    withdrawing { 0.006 }
  end

  factory :binance_client_network, class: "BinanceClient::Network" do
    address_regex { "^(bnb1)[0-9a-z]{38}$" }
    coin { "BTC" }
    deposit_desc { "Wallet Maintenance" }
    deposit_enable { false }
    is_default { false }
    memo_regex { "^[0-9A-Za-z\\-_]{1,120}$" }
    min_confirm { 1 }
    name { "BEP2" }
    network { "BNB" }
    reset_address_status { false }
    special_tips { "Both a MEMO is required" }
    un_lock_confirm { 0 }
    withdraw_desc { "Wallet Maintenance" }
    withdraw_enable { false }
    withdraw_fee { "0.00000220" }
    withdraw_integer_multiple { "0.00000001" }
    withdraw_max { "9999999999.99999999" }
    withdraw_min { "0.00000440" }
    same_address { true }
  end

end
