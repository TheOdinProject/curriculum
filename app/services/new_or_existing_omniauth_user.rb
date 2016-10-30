class NewOrExistingOmniauthUser
  attr_reader :auth

  def initialize(auth)
    @auth = auth
  end

  def create
    if existing_user?
      attributes(:notice, success_message)
    else
      attributes(:none, '')
    end
  end

  private

  def existing_user?
    omniauth_user.persisted?
  end

  def attributes(flash_type, message)
    {
      user: omniauth_user,
      flash_type: flash_type,
      flash_message: message,
    }
  end

  def success_message
    'Thanks for logging in with Github!'
  end

  def omniauth_user
    @omniauth_user ||= User.from_omniauth(auth)
  end
end
