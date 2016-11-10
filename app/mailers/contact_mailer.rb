class ContactMailer < ActionMailer::Base
  default from: 'The Odin Project <admin@theodinproject.com>'

  def suggestion_email(suggestion_text, url, user_email)
    @url = url
    @suggestion_text = suggestion_text
    @user_email = user_email

    mail(to: feedback_email_address, subject: 'Site FEEDBACK')
  end

  private

  def feedback_email_address
    'feedback@theodinproject.com'
  end
end
