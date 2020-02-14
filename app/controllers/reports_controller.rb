class ReportsController < ApplicationController
  def create
    return head :unauthorized unless user_signed_in?

    @project = Project.find(params[:project_id])
    @reported = ProjectReporter.report(
      project: @project,
      reporter: current_user,
      description: params[:description]
    )
  end
end
