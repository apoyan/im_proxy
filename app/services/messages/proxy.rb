module Messages
  class Proxy
    include Dry::Transaction(container: Container)

    step :create_message, with: 'messages.create'
    step :send_message, with: 'messages.send'
  end
end
