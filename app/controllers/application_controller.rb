class ApplicationController < ActionController::Base
  protect_from_forgery
  include BootstrapFlashHelper
  include ApplicationHelper
  after_filter :store_location

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

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (
        request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        request.fullpath != "/login" &&
        request.fullpath != "/login?ref=homenav" &&
        request.fullpath != "/logout" &&
        request.fullpath != "/logout?ref=homenav" &&
        request.request_method == "GET" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || courses_path
  end


end
