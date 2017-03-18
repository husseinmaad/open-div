class CallbacksController < Devise::OmniauthCallbacksController
  def github
    render plain: params.inspect
    # @user = User.from_omniauth(request.env["omniauth.auth"])
    # sign_in_and_redirect @user
  end
end