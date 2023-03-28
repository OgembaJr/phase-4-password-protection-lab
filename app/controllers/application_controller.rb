class ApplicationController < ActionController::API
  include ActionController::Cookies
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
