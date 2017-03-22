class CompanyMailer < ApplicationMailer
  default from: 'opendoorteam2017@gmail.com'
 p"@"*100
  def submit_company_email(user)
    @user = user
    p "&"*200
    p @user
    mail to: user.email, subject: "Thank you for Submission "
  end 
end
