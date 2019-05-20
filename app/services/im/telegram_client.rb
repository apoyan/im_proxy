module IM
  class TelegramClient < BaseClient
    private

    def response
      { status: 200, message: message.to_json }
    end
  end
end
