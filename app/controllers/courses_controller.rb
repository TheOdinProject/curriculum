class CoursesController < ApplicationController
  def index
    @courses = decorated_courses
  end

  def show
    @course = CourseDecorator.new(course)
  end

  private

  def course
    Course.includes(sections: :lessons).friendly.find(params[:id])
  end

  def decorated_courses
    ordered_courses.map { |course| CourseDecorator.new(course) }
  end

  def ordered_courses
    Course.order(:position).includes(:lessons)
  end
end
