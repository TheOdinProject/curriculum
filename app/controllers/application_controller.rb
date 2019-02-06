class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  rescue_from CanCan::AccessDenied do
    respond_to do |format|
      format.json { head :forbidden }
      format.js { head :forbidden }
      format.html do
        redirect_to root_url, alert: 'You are not authorized to do that'
      end
    end
  end

  def authenticate_admin_user!
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    home_path(ref: 'logout')
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def not_found_error
    render 'errors/not_found', status: :not_found
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: [:username])

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :email,
        :username,
        :current_password,
        :password,
        :password_confirmation,
        :learning_goal
      )
    end
  end
end
