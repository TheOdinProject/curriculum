class SplashMailer < ActionMailer::Base
  default from: "The Odin Project <admin@theodinproject.com>"
  FEEDBACK_EMAIL = "contact@theodinproject.com"
  ODIN_URL = "http://www.theodinproject.com"

  def splash_signup_confirmation_email(splash_email)
    @feedback_email = FEEDBACK_EMAIL
    @odin_url = ODIN_URL
    mail( { :to => splash_email.email, 
            :subject => "Thank You!",
            :bcc => "Erik Trautman <erik@theodinproject.com>"} )
  end

end
