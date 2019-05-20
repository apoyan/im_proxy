class MessageSenderWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5, unique: :until_executed

  def perform(message_id)
    message = Message.find(message_id)
    klass = "IM::#{message.messenger.classify}Client".constantize

    klass.new(message).send_message
  end
end
