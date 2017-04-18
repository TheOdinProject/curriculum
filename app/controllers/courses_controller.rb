class CoursesController < ApplicationController
  def index
    @courses = Course.order(:position)
  end

  def show
    @course = CourseDecorator.new(course)
    @sections = course.sections_in_course
  end

  private

  def course
    Course.friendly.find(params[:id])
  end
end
