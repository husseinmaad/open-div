# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'hussein.maad@outlook.com',
  :password => ENV['EMAIL_PW'],
  :domain => 'outlook.com',
  :address => 'smtp.office365.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}