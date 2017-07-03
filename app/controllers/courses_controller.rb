class CoursesController < ApplicationController
  def index
    @courses = decorated_courses
  end

  def show
    @course = CourseDecorator.new(course)
  end

  private

  def course
    Course.friendly.find(params[:id])
  end

  def decorated_courses
    Course.order(:position).map { |course| CourseDecorator.new(course) }
  end
end
