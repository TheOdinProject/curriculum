class RegistrationsController < Devise::RegistrationsController
  after_action :register_mailing_list, only: [:create]

  protected

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_inactive_sign_up_path_for(resource)
    dashboard_path
  end

  def update_resource(resource, params)
    if current_user.provider == 'github'
      params.delete('current_password')
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  private

  def register_mailing_list
    if resource.persisted? && ENV['MAILCHIMP_API_KEY']
      MailchimpSubscription.create(
        email: resource.email,
        username: resource.username,
        signup_date: resource.created_at
      )
    end
  end
end
