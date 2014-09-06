# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { 
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "peter.go.sabalai",
  :user_name            => "dummy.james2014@gmail.com",
  :password             => "testing 123",
  :authentication       => "plain",
  :enable_starttls_auto => true,
}
