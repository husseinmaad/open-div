class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

	# def after_sign_in_path_for(resource_or_scope)
	# 	current_user
	# end

 #  def after_update_path_for(resource)
 #    current_user
 #  end

end