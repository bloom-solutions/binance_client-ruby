module BinanceClient
  class Loader

    def self.call
      self.new.call
    end

    def call
      models
      requests
      responses
    end

    def models
      require "binance_client/models/base_model"

      Dir[File.join(binance_client_dir, "models/*.rb")].each do |f|
        require f
      end
    end

    def requests
      require "binance_client/requests/base_request"
      require "binance_client/requests/authenticated_base_request"
      require "binance_client/requests/base_create_order_request"
      Dir[File.join(binance_client_dir, "requests/*.rb")].each do |f|
        require f
      end
    end

    def responses
      require "binance_client/responses/base_response"
      require "binance_client/responses/base_create_order_response"
      Dir[File.join(binance_client_dir, "responses/*.rb")].each do |f|
        require f
      end
    end

    def binance_client_dir
      File.join(File.dirname(__FILE__))
    end

  end
end
