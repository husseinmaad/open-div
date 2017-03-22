class WelcomeMailer < ApplicationMailer
  default from: 'opendoorteam2017@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.signup_email.subject
  #
  def signup_email(user)
    @user = user
     mail to: @user.email, subject:  'Welcome to Open Door'
  end

end
