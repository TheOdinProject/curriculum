class UserMailer < ActionMailer::Base
  default from: "no-reply@theodinproject.com"

  # This is the method that allows one user to contact another
  def send_mail_to_user(message)
    @message = message
    mail(:subject => @message.subject, :to => @message.recipient.email, :from => @message.sender.email)
  end

  # This sends the welcome email after initial signup
  def send_welcome_email_to(user)
    @user = user
    @starting_lesson = Lesson.order("position asc").first
    # NOTE: this doesn't work in development! Letter_opener can't
    # find the attachment path for some unknown reason -- it keeps
    # wanting to use the local directory structure.  Must test in...
    # prod.  yuck.
    begin
      attachments.inline['logo.gif'] = File.read(view_context.asset_path('odin_head_silhouette_2_circle_simple_transparent_darker.gif'))
    rescue
      puts "Couldn't find the logo image for the welcome email"
    end
      return mail(
        :subject => "Getting started with The Odin Project",
        :to => user.email,
        :bcc => "erik@theodinproject.com",
        :template_name => "welcome_email"
      )
  end

end
