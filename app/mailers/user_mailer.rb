class UserMailer < ActionMailer::Base
  default from: "contact@theodinproject.com"

  def send_mail_to_user(message)
    @message = message
    mail(:subject => @message.subject, :to => @message.recipient.email, :from => @message.sender.email)
  end

end
