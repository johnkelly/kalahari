class ApplicationController < ActionController::API
  before_action :authenticate

  helper_method :current_user

  def current_user
    @current_user
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      email = options[:email].presence
      user = email && User.where(email: email).first

      if user && User.secure_compare(user.auth_token, token)
        @current_user = user
      end
    end
  end
end
