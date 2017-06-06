class VotesController < ApplicationController
  before_action :authenticate_request, except: [:index]

  def index
    render json: project.total_number_of_votes
  end

  def create
    project.upvote_for(current_user)
  end

  def destroy
    project.remove_vote_for(current_user)
  end

  private

  def project
    Project.find(params[:project_id])
  end

  def authenticate_request
    head :unauthorized unless user_signed_in?
  end
end
