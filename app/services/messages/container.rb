require 'dry/container'

module Messages
  class Container
    extend Dry::Container::Mixin

    namespace 'messages' do
      register 'create' do
        Create.new
      end

      register 'send' do
        Send.new
      end
    end
  end
end
