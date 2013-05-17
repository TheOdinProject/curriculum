class SplashMailer < ActionMailer::Base
  default from: "The Odin Project <admin@theodinproject.com>"
  FEEDBACK_EMAIL = "Feedback <contact@theodinproject.com>"
  ODIN_URL = "http://www.theodinproject.com"

  def splash_signup_confirmation_email(splash_email)
    @feedback_email = FEEDBACK_EMAIL
    @odin_url = ODIN_URL
    mail( { :to => splash_email.email, 
            :subject => "Thanks for your interest!",
            :bcc => "Erik Trautman <erik@theodinproject.com>"} )
  end

end
