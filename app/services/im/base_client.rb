module IM
  class BaseClient
    attr_accessor :message

    def initialize(message)
      @message
    end

    def send_message
      response
    end

    private

    def response
      raise NotImplementedError
    end
  end
end
