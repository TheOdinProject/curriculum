class OmniauthCallbacksController < ApplicationController
  def github
    auth = env["omniautuh.auth"]
    @user = User.find_for_github_oauth(request.env["omniauth.auth"],current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.succes"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.github_uid"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
end
