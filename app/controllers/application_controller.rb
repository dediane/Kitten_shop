class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_devise_parameters, if: :devise_controller?
  
  include ApplicationHelper
    after_action :create_cart_and_assign_to_current_user, only: [:create]

  protected

  def configure_devise_parameters
    # SIGN-UP : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :remember_me)}
    # ACCOUNT-UPDATE : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
    # SIGN-IN : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password, :remember_me)}
  end
end
