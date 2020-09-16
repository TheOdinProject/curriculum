class RegistrationsController < Devise::RegistrationsController
  after_action :register_mailing_list, only: [:create]

  protected

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_inactive_sign_up_path_for(_resource)
    dashboard_path
  end

  private

  def register_mailing_list
    return unless resource.persisted? && production?

    MailchimpSubscription.create(
      email: resource.email,
      username: resource.username,
      signup_date: resource.created_at
    )
  end

  def production?
    Rails.env.production? && !ENV['STAGING'].present?
  end
end
