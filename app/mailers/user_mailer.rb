class UserMailer < ActionMailer::Base
  default from: "contact@theodinproject.com"

  def send_mail_to_user(message)
    @message = message
    mail(:subject => @message.subject, :to => @message.recipient.email, :from => @message.sender.email)
  end

  def send_welcome_email_to(user)
    @user = user
    @starting_lesson = Lesson.order("position asc").first
    mail(
        :subject => "Getting started with The Odin Project",
        :to => user.email,
        :bcc => "erik@theodinproject.com",
      )
  end

end
