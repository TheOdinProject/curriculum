class ReportsController < ApplicationController
  before_action :authenticate_user!

  def create
    if report.save
      render json: report, status: :ok
    else
      render json: { error: "Unable to create report" }, status: :unprocessable_entity
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
