module IM
  class BaseClient
    def send_message(message)
      response
    end

    private

    def response
      raise NotImplementedError
    end
  end
end
