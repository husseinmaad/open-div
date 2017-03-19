class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?
  include CompaniesHelper
 	protected

 	def after_sign_in_path_for(resource_or_scope)
 		user_profile_path(current_user)
	end

  def configure_permitted_parameters
  	attr = [:first_name,:last_name]
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: attr)
  end
end
