class ProjectSubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project_submission, only: %i[update destroy]

  def create
    project_submission = current_user.project_submissions.create_or_find_by!(project_submission_params)

    if project_submission.save
      render json: ProjectSubmissionSerializer.as_json(project_submission, current_user), status: :ok
    else
      render json: project_submission.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project_submission.update(project_submission_params)
      render json: ProjectSubmissionSerializer.as_json(@project_submission, current_user), status: :ok
    else
      render json: @project_submission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project_submission.destroy

    render json: { message: 'removed' }, status: :ok
  end

  private

  def project_submission_params
    params.require(:project_submission).permit(
      :repo_url,
      :live_preview_url,
      :is_public,
      :lesson_id
    )
  end

  def find_project_submission
    @project_submission = current_user.project_submissions.find(params[:id])
  end
end
