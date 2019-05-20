module IM
  class ViberClient < BaseClient
    private

    def response
      { status: 200, message: message.to_json }
    end
  end
end
