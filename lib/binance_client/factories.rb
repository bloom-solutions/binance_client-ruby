FactoryBot.define do

  factory :binance_client_asset_balance, class: "BinanceClient::AssetBalance" do
    sequence(:asset) { |n| "ASSET#{n}" }
    free { rand(10_000) }
    locked { rand(1_000) }

    initialize_with do
      new(asset: asset, free: free, locked: locked)
    end
  end

end
