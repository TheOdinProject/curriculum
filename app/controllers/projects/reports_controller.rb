class Projects::ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = report

    if @report.save
      render json: @report, status: :ok
    else
      render json: { error: "Unable to report project" }, status: :unprocessable_entity
    end
  end

  private

  def report
    Report.new(
      project: project,
      reporter: current_user,
      reason: params[:reason]
    )
  end

  def project
    Project.find(params[:project_id])
  end
end
