class ProjectSubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_submission, only: %i(update destroy)

  def index; end

  def create
    project_submission = current_user.project_submissions.create!(project_submission_params)

    render json: { project_submission: ProjectSubmissionSerializer.as_json(project_submission) }, status: :ok
  end

  def update
    @project_submission.update(project_submission_params)

    render json: { project_submission: ProjectSubmissionSerializer.as_json(@project_submission) }, status: :ok
  end

  def destroy
    @project_submission.destroy

    render json: { message: 'removed' }, status: :ok
  end

  private

  def find_project_submission
    @project_submission = ProjectSubmission.find(params[:id])
  end

  def project_submission_params
    params.require(:project_submission).permit(
      :repo_url,
      :live_preview_url,
      :is_public,
      :lesson_id
    )
  end
end
