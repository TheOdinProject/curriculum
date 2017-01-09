class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def github
    flash[flash_type] = flash_message
    redirect_to_path
  end

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end

  private

  def github_omniauth
    @github_omniauth ||= omniauth_scenario
  end

  def omniauth_scenario
    if user_signed_in?
      LinkOmniauth.new(current_user, auth).create
    else
      NewOrExistingOmniauthUser.new(auth).create
    end
  end

  def flash_type
    github_omniauth.fetch(:flash_type)
  end

  def flash_message
    github_omniauth.fetch(:flash_message)
  end

  def user
    @user ||= github_omniauth.fetch(:user)
  end

  def auth
    request.env['omniauth.auth']
  end

  def store_user_details
    session['devise.user_attributes'] = user.attributes
  end

  def user_needs_to_verify_details?
    user.new_record?
  end

  def redirect_to_path
    if user_signed_in?
      redirect_to courses_path
    elsif user_needs_to_verify_details?
      store_user_details
      redirect_to new_user_registration_url
    else
      sign_in_and_redirect user
    end
  end
end
