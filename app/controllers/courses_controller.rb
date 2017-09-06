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
    Course.order(:position).includes(:lessons, sections: [:lessons])
  end

  def set_user
    if user_signed_in?
      @user = User.includes(:lesson_completions).find(current_user.id)
    end
  end
end
