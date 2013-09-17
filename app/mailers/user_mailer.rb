class UserMailer < ActionMailer::Base
  default from: "contact@theodinproject.com"

  def send_mail_to_user(message)
    @message = message
    mail(:subject => @message.subject, :body => @message.body, :to => @message.recipient, :from => @message.sender.email, :cc => @message.sender.email)
  end

end
