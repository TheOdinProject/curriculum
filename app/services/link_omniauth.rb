class LinkOmniauth
  attr_reader :user, :auth
  private :user, :auth

  def initialize(user, auth)
    @user = user
    @auth = auth
  end

  def create
    if user.add_omniauth(auth)
      attributes(:notice, success_message)
    else
      attributes(:error, failure_message)
    end
  end

  private

  def success_message
    'Successfully linked Github to your account'
  end

  def failure_message
    "We couldn't link Github to your account"
  end

  def attributes(flash_type, message)
    {
      user: user,
      flash_type: flash_type,
      flash_message: message,
    }
  end
end
