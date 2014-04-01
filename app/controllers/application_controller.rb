class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_user

  include BootstrapFlashHelper
  include ApplicationHelper

  # Customize Devise to send signed out users to the home page not root
  def after_sign_out_path_for(resource_or_scope)
    home_path(:ref => "logout")
  end

  # Customize Devise to send newly signed in users to the home page
  def after_sign_in_path_for(resource_or_scope)
    courses_path(:ref => "login")
  end

  # redirects to error pages
  def bad_request
    #redirect_to "#{Rails.root}/public/400.html"
    raise ActionController::RoutingError.new('Bad Request')
  end

  # private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

end
