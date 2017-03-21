class WelcomeMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email,subject:"Welcome to my site", from:'husseinmaad90@gmail.com'
  end 
end
