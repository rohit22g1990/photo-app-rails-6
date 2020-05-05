# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# if Rails.env.deveopment? || Rails.env.test?
  ActionMailer::Base.smtp_settings = {
    # :address => 'smtp.gmail.com',
    :address => 'smtp-relay.sendinblue.com',
    :port => '587',
    :authentication => :plain,
    :user_name => Rails.application.credentials.sendinblue[:username],
    :password => Rails.application.credentials.sendinblue[:password],
    :domain => 'rohit-photo-app.herokuapp.com',
    :enable_starttls_auto => true
  }
  
# else
#   ActionMailer::Base.smtp_settings = {
#     # :address => 'smtp.sendgrid.net',
#     :address => 'smtp.gmail.com',
#     :port => '587',
#     :authentication => :plain,
#     # :user_name => ENV["SENDGRID_USERNAME"],
#     # :password => ENV["SENDGRID_PASSWORD"],
#     :user_name => 'rohitghotkar123@gmail.com',
#     :password => 'My@ttitude1234',
#     # :domain => 'heroku.com',
#     :domain => 'gmail.com',
#     :enable_starttls_auto => true
#   }
# end
