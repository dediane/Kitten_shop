# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# MAILER GMAIL (REMI BARNAT TEST)
ActionMailer::Base.smtp_settings =   {
  :address            => 'smtp.gmail.com',
  :port               => 587,
  :domain             => 'gmail.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => ENV['GMAIL_LOGIN'],
  :password           => ENV['GMAIL_PWD']
}