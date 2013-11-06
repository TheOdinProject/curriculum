class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    courses_path(:ref => "signup", :newuser => "true")
  end
end