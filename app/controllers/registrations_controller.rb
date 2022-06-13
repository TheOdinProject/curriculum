# rubocop: disable Rails/LexicallyScopedActionFilter
class RegistrationsController < Devise::RegistrationsController
  after_action :send_welcome_email, only: [:create]

  protected

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_inactive_sign_up_path_for(_resource)
    dashboard_path
  end

  private

  def send_welcome_email
    return if ENV['STAGING'] && !resource.persisted?

    WelcomeEmailJob.perform_async(resource.id)
  end

  def production?
    Rails.env.production? && ENV['STAGING'].blank?
  end
end
# rubocop: enable Rails/LexicallyScopedActionFilter
