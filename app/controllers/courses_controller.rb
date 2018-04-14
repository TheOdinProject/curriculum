class CoursesController < ApplicationController
  before_action :set_user

  def index
    @courses = decorated_courses
  end

  def show
    @course = CourseDecorator.new(course)
  end

  private

  def course
    Course.includes(:lessons, sections: [:lessons]).friendly.find(params[:id])
  end

  def decorated_courses
    ordered_courses.map { |course| CourseDecorator.new(course) }
  end

  def ordered_courses
    Course.order(:position)
  end

  # TODO: remove me and just use current_user everywhere
  def set_user
    @user = current_user
  end
end
