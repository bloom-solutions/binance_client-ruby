module BinanceClient
  class GetAllRequest < AuthenticatedBaseRequest
    private

    def path
      "/sapi/v1/capital/config/getall"
    end

  end
end
