class WelcomeMailer < ApplicationMailer
  default from: 'opendoorteam2017@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.signup_email.subject
  #
  def signup_email
    @greeting = "Hi"
# lupita.dav@gmail.com
     mail to: "hussein.maad@outlook.com"
  end
end
