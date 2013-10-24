class LessonsController < ApplicationController

  def index
    @course = Course.find_by_title_url!(params[:course_name])
    raise ActionController::RoutingError.new('Not Found') unless @course.is_active
    @lessons = @course.lessons.order("position asc")
    @sections = @course.sections.includes(:lessons)
  end

  def show
    @course = Course.find_by_title_url!(params[:course_name])
    raise ActionController::RoutingError.new('Not Found') unless @course.is_active
    @lesson = @course.lessons.find_by_title_url!(params[:lesson_name])
    @content = md(@lesson.content)
    @next_lesson = @lesson.next_lesson
    @prev_lesson = @lesson.prev_lesson
    @num_lessons = @lesson.section.lessons.where(:is_project => false).count
    @num_projects = @lesson.section.lessons.where(:is_project => true).count
    # the position of the lesson not including projects
    @lesson_position_in_section = @lesson.section.lessons.where("is_project = ? AND position <= ?", false, @lesson.position).count
  end
  
end
