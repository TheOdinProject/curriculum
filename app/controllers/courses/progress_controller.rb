module Courses
  class ProgressController < ApplicationController
    before_action :authenticate_user!

    def show
      course = Course.find_by(id: params[:id])

      if course
        render json: { percentage: course.progress_for(current_user).percentage }
      else
        render json: { message: 'Unable to find course' }, status: :not_found
      end
    end
  end
end
