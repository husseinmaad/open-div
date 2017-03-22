class CompanyMailer < ApplicationMailer
  default from: 'opendoorteam2017@gmail.com'

  def submit_company_email(user)
    @user = user

    mail to: user.email, subject: "Thank you for Submission "
  end 
end
