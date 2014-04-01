class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def github
  #binding.pry
  omniauth = request.env["omniauth.auth"]
  user = User.find_by(provider: omniauth['provider'], uid: omniauth['uid'])
  if user
    flash[:notice] = "Signed in successfully."
    sign_in_and_redirect(:user, user)
  elsif current_user
     current_user.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
     flash[:notice] = "Authentication successful."
     sign_in_and_redirect(:user, user)
  else
   # binding.pry
    user = User.create(provider: omniauth['provider'], uid: omniauth['uid'], email: omniauth['info']['email'], username: omniauth['info']['nickname'])
    # session[:omniauth] = omniauth.except('extra')
    if user
      flash.now[:notice] = "Signed in successfully"
      # current_user = user
      #sign_in(:user, user)
      #@current_user ||= User.find(session[:user_id]) if session[:user_id]
      sign_in_and_redirect(:user, user)
      #redirect_to courses_url
    else
      session[:omniauth] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
    # sign_in_and_redirect(:user, user)
  end
end
end
