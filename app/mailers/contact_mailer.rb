class ContactMailer < ActionMailer::Base
  default from: "The Odin Project <admin@theodinproject.com>"
  FEEDBACK_EMAIL = "feedback@theodinproject.com"
  CONTACT_EMAIL = "contact@theodinproject.com"
  ODIN_URL = "http://www.theodinproject.com"


  def suggestion_email(suggestion_text, url="", user_email="")
    @url = url
    @suggestion_text = suggestion_text
    @user_email = user_email
    mail( { :to => FEEDBACK_EMAIL,
            :subject => "Site FEEDBACK" } )
  end


end
