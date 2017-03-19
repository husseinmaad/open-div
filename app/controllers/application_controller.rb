class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?
  include CompaniesHelper
 	protected

  def configure_permitted_parameters


  	attr = [:first_name,:last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attr)
  end
end
