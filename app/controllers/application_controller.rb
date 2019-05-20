class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  private

  def handle_invalid_params(validation_result)
    messages = validation_result.messages

    respond_to do |format|
      format.json { render json: { errors: messages }, status: :bad_request }
      format.any { render plain: { errors: messages }, status: :bad_request }
    end
  end
end
