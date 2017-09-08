class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def github
    @user = UserProvider.find_user(auth)
    update_users_avatar if avatar_needs_updated?

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => provider_title)
    else
      session['devise.github_data'] = auth
      redirect_to new_user_registration_url
    end
  end
  alias_method :google, :github

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end

  private

  def provider_title
    auth.provider.capitalize
  end

  def provider_data
    "#devise.#{auth}_data"
  end

  def update_users_avatar
    @user.update_avatar(github_avatar)
  end

  def avatar_needs_updated?
    github_avatar != @user.avatar
  end

  def github_avatar
    @github_avatar ||= auth.info.image
  end

  def auth
    request.env['omniauth.auth']
  end
end
