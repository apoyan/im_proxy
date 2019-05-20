require 'dry/transaction'
require 'dry/transaction/operation'

module Messages
  class Create
    include Dry::Transaction::Operation

    def call(input)
      body = input[:body]
      receivers = input[:receivers]
      messages = []

      receivers.each do |receiver|
        receiver[:user_ids].each do |user_id|
          message = Message.new(
            user_id: user_id,
            messenger: receiver[:messenger],
            body: body,
            delivery_at: receiver[:delivery_at]
          )

          message.save
          messages << message
        end
      end

      Success(messages: messages)
    end
  end
end
