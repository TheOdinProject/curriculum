class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
  #   auth = env["omniautuh.auth"]
  #   @user = User.find_for_github_oauth(request.env["omniauth.auth"],current_user)
  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.succes", :kind => "Github"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     session["devise.github_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
  omniauth = request.env["omniauth.auth"]
  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  if authentication
    flash[:notice] = "Signed in successfully."
    sign_in_and_redirect(:user, authentication.user)
  elsif current_user
    current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  else
    user = User.new
    user.authentications.build(:provider => omniauth ['provider'], :uid => omniauth['uid'])
    if user.save
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect(:user, user)
    else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
  end
end
end
