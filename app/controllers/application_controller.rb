class ApplicationController < ActionController::Base
  protect_from_forgery
  include BootstrapFlashHelper
  include ApplicationHelper
  after_filter :store_location

  # Customize Devise to send signed out users to the home page not root
  def after_sign_out_path_for(resource_or_scope)
    home_path(:ref => "logout")
  end

  # redirects to error pages
  def bad_request
    #redirect_to "#{Rails.root}/public/400.html"
    raise ActionController::RoutingError.new('Bad Request')
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.

    uri = URI::parse(request.fullpath)
    request_path = uri.path

    blacklisted_paths = [
        root_path,
        home_path,
        home_path,
        new_user_session_path,
        signup_path,
        sign_up_path,
        new_user_registration_path,
        edit_user_registration_path,
        cancel_user_registration_path,
        new_user_password_path,
        edit_user_password_path,
        login_path,
        logout_path,
    ]

    # make sure the request isn't on our danger list
    # of paths which might cause infinite redirects
    # Note that these only include GET paths because
    # of the logic below
    request_not_blacklisted = !blacklisted_paths.include?(request_path)

    # make sure we exclude any callbacks from logins
    # e.g. the Github login
    # because it would otherwise cause a redirect
    # which runs the callback twice and blows up
    # because omniauth thinks it's an CSRF attack
    request_not_auth_related = !(/^\/users\/auth/.match(request_path))

    # let the ajax calls go in peace without saving the previous url
    request_not_ajax = !request.xhr?

    # don't worry about any post methods etc.
    request_get_request = request.request_method == "GET"

    if (    request_not_blacklisted &&
            request_not_auth_related &&
            request_get_request &&
            request_not_ajax )
      session[:previous_url] = request.fullpath
    end
  end


  def after_sign_in_path_for(resource)
    if current_user.reg_before_conf == true && current_user.confirmed_at == nil
      flash[:partial] = "confirm_email" 
    end 
    session[:previous_url] || courses_path(:ref => "login")
  end


end
