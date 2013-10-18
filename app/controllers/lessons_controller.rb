class LessonsController < ApplicationController

  def index
    @course = Course.find_by_title_url!(params[:course_name])
    @lessons = @course.lessons.order("position asc")
    @sections = @course.sections.includes(:lessons)
  end

  def show
    @course = Course.find_by_title_url!(params[:course_name])
    @lesson = @course.lessons.find_by_title_url!(params[:lesson_name])
    @content = md(@lesson.content)
  end
  
end
