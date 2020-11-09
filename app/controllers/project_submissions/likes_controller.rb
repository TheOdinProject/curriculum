class ProjectSubmissions::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @project_submission = ProjectSubmission.find(params[:submission_id])

    if params[:is_liked_by_current_user]
      @project_submission.unliked_by current_user
    else
      @project_submission.liked_by current_user
    end

    render json: ProjectSubmissionSerializer.as_json(@project_submission, current_user), status: :ok
  end
end
