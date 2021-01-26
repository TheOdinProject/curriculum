class WelcomeEmailJob
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: true

  def perform(user_id)
    user = User.find_by(id: user_id)

    UserMailer.send_welcome_email_to(user).deliver_now! if user.present?
  end
end
