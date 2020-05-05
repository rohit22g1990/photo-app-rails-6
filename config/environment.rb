# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.deveopment? || Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :authentication => :plain,
    :user_name => Rails.application.credentials.sendgrid[:username],
    :password => Rails.application.credentials.sendgrid[:password],
    :domain => 'heroku.com',
    :enable_starttls_auto => true
  }
else
  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :authentication => :plain,
    :user_name => ENV["SENDGRID_USERNAME"],
    :password => ENV["SENDGRID_PASSWORD"],
    :domain => 'heroku.com',
    :enable_starttls_auto => true
  }
end
