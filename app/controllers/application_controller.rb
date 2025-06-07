class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def base_api_response(status: "success", message:, http_status: :ok)
    render json: { status: status, message: message }, status: http_status
  end
end
