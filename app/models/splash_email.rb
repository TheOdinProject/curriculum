class SplashEmail < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email

  after_create :send_signup_confirm

  def send_signup_confirm
    SplashMailer.splash_signup_confirmation_email(self).deliver!
  end
end
