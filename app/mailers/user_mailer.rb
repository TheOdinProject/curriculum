class UserMailer < ActionMailer::Base
  default from: 'no-reply@theodinproject.com'

  def send_welcome_email_to(user, token)
    @user = user
    @token = token
    @starting_lesson = first_lesson
    attachments.inline['logo.gif'] = logo_path

    mail(
          subject: 'Getting started with The Odin Project',
          to: user.email,
          bcc: 'erik@theodinproject.com',
          template_name: 'welcome_email',
        )
  end

  private

  def first_lesson
    Lesson.order(position: :asc).first
  end

  def logo_path
    File.read(Rails.root.join('app/assets/images/odin_head_silhouette_2_circle_simple_transparent_darker.gif'))
  end
end
