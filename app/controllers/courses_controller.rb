class CoursesController < ApplicationController

  def index
    @courses = decorated_courses
  end

  def show
    @course = CourseDecorator.new(course)
  end

  private

  def decorated_courses
    ordered_courses.map { |course| CourseDecorator.new(course) }
  end

  def ordered_courses
    Course.order(:position)
  end

  def course
    Course.includes(:lessons, sections: [:lessons]).friendly.find(params[:id])
  end
end
