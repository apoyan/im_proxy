class MessageController < ApplicationController
  before_action :validate_params

  def send_message
    result = Messages::Proxy.new.(@message_params)

    if result.success?
      render json: { success: true, results: result.success }
    else
      render json: { success: false, errors: result.failure }
    end
  end

  private

  def send_params
    params.require(:message).permit!
  end

  def validate_params
    schema = Dry::Validation.Schema do
      required(:body).filled(:str?)
      required(:receivers).each do
        schema do
          required(:messenger).filled(:str?, included_in?: %w[viber telegram whatsapp])
          required(:user_ids).each(:str?)
          optional(:deliver_at).maybe(:date_time?)
        end
      end
    end

    result = schema.call(send_params.to_h)

    @message_params = result.output

    handle_invalid_params(result) if result.failure?
  end
end
