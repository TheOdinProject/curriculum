class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def all
    auth = request.env["omniauth.auth"]
    existing_user = User.where(email: auth['info']['email']).first
    add_to_existing = existing_user && user_signed_in? && (current_user.email == auth['info']['email'])
    user = User.from_omniauth(request.env["omniauth.auth"], add_to_existing)
    if user.persisted?
      flash.notice = "Signed in!"
      user.save if add_to_existing
      sign_in_and_redirect user
    else
      user.attributes
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :github, :all

  def failure
    flash[:alert] = 'Authentication failed.'
    redirect_to root_path
  end
end
