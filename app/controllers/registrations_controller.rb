class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(_resource)
    session[:previous_url] || courses_path(ref: 'signup', newuser: 'true')
  end

  def after_update_path_for(_resource)
    courses_path
  end

  def update_resource(resource, params)
    if current_user.provider == 'github'
      params.delete('current_password')
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end
end
