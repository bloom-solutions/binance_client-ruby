module BinanceClient
  class Transfer

    attr_reader :raw_hash

    def initialize(raw_hash:)
      @raw_hash = raw_hash
    end

    def from_id
      @from_id ||= raw_hash["fromId"]
    end

    def to_id
      @to_id ||= raw_hash["toId"]
    end

    def asset
      @asset ||= raw_hash["asset"]
    end

    def qty
      @qty ||= raw_hash["qty"]
    end

    def time
      @time ||= raw_hash["time"]
    end

    def txn_id
      @txn_id ||= raw_hash["txnId"]
    end

    def client_tran_id
      @client_tran_id ||= raw_hash["clientTranId"]
    end

    def status
      @status ||= raw_hash["status"]
    end


  end
end
