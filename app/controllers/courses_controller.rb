class CoursesController < ApplicationController

  def index
    @courses = Course.order("position asc").includes(:lessons)
  end

  def show
    @course = Course.find(params[:id])
  end
end
