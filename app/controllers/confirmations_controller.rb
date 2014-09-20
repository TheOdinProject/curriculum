class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      sign_in(resource_name, resource)
      flash[:notice] = "Thanks for confirming your email address!"
      courses_path
    end
end