class NotificationMailer < ActionMailer::Base
  
  include SendGrid
  
  default :from => "hello@mainstproject.com"

  def signup_email(user)
    @user = user
    mail( :to => user.email,
    :subject => "Welcome #{user.email}!")
  end
end