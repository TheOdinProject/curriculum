class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
  #binding.pry
  omniauth = request.env["omniauth.auth"]
  user = User.find_by(provider:omniauth['provider'], uid: omniauth['uid'])
  if user
    flash[:notice] = "Signed in successfully."
    sign_in_and_redirect(:user, user)
  elsif current_user
     current_user.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
     flash[:notice] = "Authentication successful."
     sign_in_and_redirect(:user, user)
  else
    user = User.new(:provider => omniauth['provider'], :uid => omniauth['uid'])
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
