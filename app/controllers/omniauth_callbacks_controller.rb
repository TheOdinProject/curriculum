class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = UserProvider.find_user(auth)

    update_users_avatar if avatar_needs_updated?

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user
    else
      session['devise.github_data'] = auth
      redirect_to new_user_registration_url
    end
  end
  alias google github

  def failure
    redirect_to new_user_session_path, alert: 'Authentication failed'
  end

  private

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
