class SplashMailer < ActionMailer::Base
  default from: "The Odin Project <admin@theodinproject.com>"
  FEEDBACK_EMAIL = "feedback@theodinproject.com"
  CONTACT_EMAIL = "contact@theodinproject.com"
  ODIN_URL = "http://www.theodinproject.com"
  CURRICULUM_URL = "http://www.github.com/TheOdinProject/curriculum"

  def splash_signup_confirmation_email(splash_email)
    @feedback_email = FEEDBACK_EMAIL
    @odin_url = ODIN_URL
    @curriculum_url = CURRICULUM_URL
    mail( { :to => splash_email.email, 
            :subject => "Thank You!",
            :bcc => "Erik Trautman <erik@theodinproject.com>"} )
  end

  def splash_suggestion_email(suggestion_text)
    @suggestion_text = suggestion_text
    mail( { :to => FEEDBACK_EMAIL,
            :subject => "SPLASH FEEDBACK" } )
  end

end
