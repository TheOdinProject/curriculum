class UserMailer < ApplicationMailer
  default from: 'The Odin Project <contact@theodinproject.com>'

  def send_welcome_email_to(user)
    @user = user

    mail(
      subject: 'Getting started with The Odin Project',
      to: user.email,
      template_name: 'welcome_email',
    )
  end
end
