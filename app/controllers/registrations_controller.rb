class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters, if: :devise_controller?

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :legal_agreement
    devise_parameter_sanitizer.for( :account_update ) do |u|
      u.permit( :email, :username, :current_password, :password, :password_confirmation, :about )
    end
  end

  def after_sign_up_path_for(resource)
    session[:previous_url] || courses_path(:ref => "signup", :newuser => "true")
  end

  def after_update_path_for(resource)
    courses_path
  end
end
