class Api::PointsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate, except: %i[index show]

  def index
    render json: Point.all.order(points: :desc).limit(params[:limit]).offset(params[:offset])
  end

  def show
    user_points = Point.find_by(discord_id: params[:id])

    if user_points.present?
      render json: user_points
    else
      render json: { message: 'Unable to find that user' }
    end
  end

  def create
    user_points = Point.find_or_create_by(discord_id: params[:discord_id].to_i)
    user_points.increment_points

    render json: user_points
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token|
      ActiveSupport::SecurityUtils.secure_compare(token, ENV['ODIN_BOT_ACCESS_TOKEN'])
    end
  end
end
