class CoursesController < ApplicationController
  def index
    @courses = Course.order(position: :asc)
  end

  def show
    @course = Course.friendly.find(params[:id])
  end
end
