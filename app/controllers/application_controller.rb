class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token
  def bad_token
    flash[:warning] = "Session expired"
    redirect_to root_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:birthday, :nickname, :email, :password, :sex, :weight)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:birthday, :nickname, :email, :password, :sex, :weight)}
  end
end
