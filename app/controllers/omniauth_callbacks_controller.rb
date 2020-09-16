class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def github
    @user = UserProvider.find_user(auth)

    update_users_avatar if avatar_needs_updated?

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: provider_title)
    else
      session['devise.github_data'] = auth
      redirect_to new_user_registration_url
    end
  end
  alias google github

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end

  private

  def provider_title
    auth.provider.capitalize
  end

  def update_users_avatar
    @user.update!(avatar: avatar_from_provider)
  end

  def avatar_needs_updated?
    avatar_from_provider != @user.avatar
  end

  def avatar_from_provider
    @avatar_from_provider ||= auth.info.image
  end

  def auth
    request.env['omniauth.auth']
  end
end
