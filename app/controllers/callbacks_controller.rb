require "open-uri"
class CallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if !@user.avatar 
    @user.avatar = open(request.env["omniauth.auth"]["info"]["image"]) 
    @user.first_name = request.env["omniauth.auth"]["info"]["name"]
    @user.save
  	end
    sign_in_and_redirect @user
  end
end