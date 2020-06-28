class VotesController < ApplicationController
  before_action :authenticate_request

  def create
    @project = Project.find(params[:project_id])
    return head :bad_request if @project.user == current_user
    @project.upvote_for(current_user)
    @decorated_project = ProjectDecorator.new(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    return head :bad_request if @project.user == current_user
    @project.remove_vote_for(current_user)
    @decorated_project = ProjectDecorator.new(@project)
  end

  private

  def authenticate_request
    head :unauthorized unless user_signed_in?
  end
end
