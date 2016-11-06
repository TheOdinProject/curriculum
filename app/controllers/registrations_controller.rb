class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    session[:previous_url] || courses_path(:ref => "signup", :newuser => "true")
  end

  def after_update_path_for(resource)
    courses_path
  end
end
