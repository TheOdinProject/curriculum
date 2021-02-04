class MailingListJob
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: false

  def perform(user_id)
    user = User.find(user_id)

    MailchimpSubscription.create(
      email: user.email,
      username: user.username,
      signup_date: user.created_at
    )
  end
end
