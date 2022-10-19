module BinanceClient
  class Account

    include Virtus.model

    LOCAL_TO_REMOTE_ATTR_MAP = {
      sub_account_id: "subaccountId",
      email: "email",
      tag: "tag",
      maker_commission: "makerCommission",
      taker_commission: "takerCommission",
      margin_maker_commission: "marginMakerCommission",
      margin_taker_commission: "marginTakerCommission",
      create_time: "createTime",
    }

    attribute :sub_account_id, Integer, lazy: true, default: :default_sub_account_id
    attribute :email, String, lazy: true, default: :default_email
    attribute :tag, String, lazy: true, default: :default_tag
    attribute :maker_commission, BigDecimal, lazy: true, default: :default_maker_commission
    attribute :taker_commission, BigDecimal, lazy: true, default: :default_taker_commission
    attribute :margin_maker_commission, BigDecimal, lazy: true, default: :default_margin_maker_commission
    attribute :margin_taker_commission, BigDecimal, lazy: true, default: :default_margin_taker_commission
    attribute :create_time, Integer, lazy: true, default: :default_create_time

    attribute :raw_hash, Hash

    private

    LOCAL_TO_REMOTE_ATTR_MAP.each do |local_attr, remote_attr|
      define_method :"default_#{local_attr}" do
        raw_hash[remote_attr]
      end
    end

  end
end
