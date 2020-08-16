class ProjectSubmissions::ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = report

    if @report.save
      render json: @report, status: :ok
    else
      render json: { error: "Unable to report project submission" }, status: :unprocessable_entity
    end
  end

  private

  def report
    Report.new(
      project_submission: project_submission,
      reporter: current_user,
      reason: params[:reason]
    )
  end

  def project_submission
    ProjectSubmission.find(params[:project_submission_id])
  end
end
