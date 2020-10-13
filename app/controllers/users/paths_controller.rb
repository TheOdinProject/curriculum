module Users
  class PathsController < ApplicationController
    before_action :authenticate_user!

    def create
      current_user.update_attributes!(path_id: path_id)
      redirect_to path
    end

    private

    def path_id
      params.fetch(:path_id)
    end

    def path
      Path.find(path_id)
    end
  end
end
