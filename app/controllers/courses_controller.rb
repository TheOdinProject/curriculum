class CoursesController < ApplicationController
  def show
    @course = course
    @sections = course.sections.includes(:lessons)
  end

  private

  def course
    path.courses.friendly.find(params[:id])
  end

  def path
    Path.find(params[:path_id])
  end
end
