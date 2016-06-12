class LessonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found_error

  def index
    @course = find_course
  end

  def show
    @course = find_course
    @lesson = find_lesson unless @course.nil?

    if show_ads?
      @lower_banner_ad = true
      @right_box_ad = true
    end
  end

  private

  def find_course
    @find_course ||= Course.find_by(title_url: course_title)
  end

  def find_lesson
    @find_lesson ||= Lesson.find_by(title_url: lesson_title)
  end

  def course_title
    params[:course_name]
  end

  def lesson_title
    params[:lesson_name]
  end

  def show_ads?
    ENV["SHOW_ADS"] && Ad.show_ads?(current_user)
  end

  def not_found_error
    raise ActionController::RoutingError.new('Not Found')
  end
end
