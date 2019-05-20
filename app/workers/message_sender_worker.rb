class MessageSenderWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5, unique: :until_executed

  def perform(message_id)
    message = Message.find(message_id)
    klass = "IM::#{message.type.classify}".constantize

    klass.send_message(message)
  end
end
