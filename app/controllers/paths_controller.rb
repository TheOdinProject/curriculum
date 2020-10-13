class PathsController < ApplicationController
  def show
    @path = Path.friendly.find(params[:id])
    @courses = decorated_courses
    @user = current_user
  end

  def index
    @paths = Path.all
  end

  private

  def decorated_courses
    @path.courses.map { |course| CourseDecorator.new(course) }
  end
end
