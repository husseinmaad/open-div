class CompanyMailer < ApplicationMailer
  default from: 'opendoorteam2017@gmail.com'
 
  def submit_company_email(user,company)
    @user = user
    @company = company
    mail to: user.email, subject: "Thank you for "
  end 
end
