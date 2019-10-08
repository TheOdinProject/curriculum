module Users
  class TracksController < ApplicationController
    before_action :authenticate_request

    def create
      current_user.update_attributes!(track_id: track_id)
      redirect_to track
    end

    private

    def track_id
      params.fetch(:track_id)
    end

    def track
      Track.find(track_id)
    end

    def authenticate_request
      head :unauthorized unless user_signed_in?
    end
  end
end
