class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def github
    @user = User.from_omniauth(auth)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'GitHub') if is_navigational_format?
    elsif user_signed_in?
      flash[flash_type] = flash_message
      sign_in_and_redirect current_user
    else
      session['devise.github_data'] = auth
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def link_ominauth
    @link_ominauth ||= LinkOmniauth.new(@user, auth).create
  end

  def flash_type
    link_ominauth[:flash_type]
  end

  def flash_message
    link_ominauth[:flash_message]
  end
end
