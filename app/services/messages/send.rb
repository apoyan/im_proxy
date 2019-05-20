require 'dry/transaction'
require 'dry/transaction/operation'

module Messages
  class Send
    include Dry::Transaction::Operation

    def call(input)
      messages = input[:messages]

      messages.each do |message|
        if message.delivery_at.present?
          MessageSenderWorker.perform_at(message.delivery_at, message.id)
        else
          MessageSenderWorker.perform_async(message.id)
        end
      end

      Success(messages.map { |m| MessageEntity.build(m) })
    end
  end
end
