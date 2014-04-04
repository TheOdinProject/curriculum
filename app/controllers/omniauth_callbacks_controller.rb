class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :github, :all

  # def github
  #   #binding.pry
  #   omniauth = request.env["omniauth.auth"]
  #   user = User.find_by(provider: omniauth['provider'], uid: omniauth['uid'])
  #   if user
  #     flash[:notice] = "Signed in successfully."
  #     sign_in_and_redirect(:user, user)
  #   elsif current_user
  #      current_user.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
  #      flash[:notice] = "Authentication successful."
  #      sign_in_and_redirect(:user, user)
  #   else
  #     if user = User.new(provider: omniauth['provider'], uid: omniauth['uid'], email: omniauth['info']['email'], username: omniauth['info']['nickname'])
  #       user.legal_agreement = true
  #       user.save
  #       flash.now[:notice] = "Signed in successfully"
  #       sign_in_and_redirect(:user, user)
  #     else
  #       session[:omniauth] = omniauth.except('extra')
  #       redirect_to new_user_registration_url
  #     end
  #     # sign_in_and_redirect(:user, user)
  #   end
  #   # if user
  #   #   flash[:notice] = "Signed in successfully."
  #   #   sign_in_and_redirect(:user, user)
  #   # elsif current_user
  #   #    current_user.create(:provider => omniauth['provider'], :uid => omniauth['uid'])
  #   #    flash[:notice] = "Authentication successful."
  #   #    sign_in_and_redirect(:user, user)
  #   # else
  #   #     user = User.new(provider: omniauth['provider'], uid: omniauth['uid'], email: omniauth['info']['email'], username: omniauth['info']['nickname'])
  #   #   if session[:legalAgreement]
  #   #     user.save
  #   #     flash.now[:notice] = "Signed in successfully"
  #   #     sign_in_and_redirect(:user, user)
  #   #   else
  #   #     session[:omniauth] = omniauth.except('extra')
  #   #     redirect_to new_user_registration_url
  #   #   end
  #   #   # sign_in_and_redirect(:user, user)
  #   # end
  # end
end
