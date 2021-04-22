class ProjectSubmissions::FlagsController < ApplicationController
  before_action :authenticate_user!

  def create
    if flag.save
      notify_discord_admins
      render json: flag, status: :ok
    else
      render json: { error: 'Unable to flag project submission' }, status: :unprocessable_entity
    end
  end

  private

  def flag
    @flag ||= Flag.new(flag_params)
  end

  def flag_params
    params.permit(:project_submission_id, :reason).merge(flagger: current_user)
  end

  def project_submission
    @project_submission ||= ProjectSubmission.find(params[:project_submission_id])
  end

  def notify_discord_admins
    return unless Rails.env.production?

    DiscordNotifier.notify(
      Notifications::FlagSubmission.new(flag)
    )
  end
end
