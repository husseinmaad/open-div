require "open-uri"
class CallbacksController < Devise::OmniauthCallbacksController

  def github
  @user = User.find_by(email: request.env["omniauth.auth"]["info"]["email"] )
     if @user
         sign_in(@user)
         redirect_to user_profile_path @user
     else
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
      end
  end
end