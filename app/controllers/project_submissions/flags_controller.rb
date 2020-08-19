class ProjectSubmissions::FlagsController < ApplicationController
  before_action :authenticate_user!

  def create
    @flag = flag

    if @flag.save
      notify_discord_admins
      render json: @flag, status: :ok
    else
      render json: { error: "Unable to flag project submission" }, status: :unprocessable_entity
    end
  end

  private

  def flag
    Flag.new(
      project_submission: project_submission,
      flagger: current_user,
      reason: params[:reason]
    )
  end

  def project_submission
    @project_submission ||= ProjectSubmission.find(params[:project_submission_id])
  end

  def notify_discord_admins
    DiscordNotifier.notify(Notifications::FlagSubmission.new(
      flagger: current_user,
      project_submission: project_submission,
      reason: params[:reason]
    ))
  end
end
