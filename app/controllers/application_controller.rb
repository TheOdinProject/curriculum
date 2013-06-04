class ApplicationController < ActionController::Base
  protect_from_forgery

  include BootstrapFlashHelper

  # Customize Devise to send signed out users to the home page not root
  def after_sign_out_path_for(resource_or_scope)
    home_path
  end

  # Customize Devise to send newly signed in users to the scheduler first
  def after_sign_in_path_for(resource_or_scope)
    scheduler_path
  end

end
