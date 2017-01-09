class LessonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def show
    @lesson = decorated_lesson
    @project = set_project
    set_ads
  end

  private
  
  def set_ads
    return unless show_ads?
    @lower_banner_ad = true
    @right_box_ad = true
  end

  def show_ads?
    ENV['SHOW_ADS'] && Ad.show_ads?
  end

  def set_project
    return unless user_signed_in?
    user_project || new_project
  end

  def user_project
    Project.where(user_id: current_user.id, lesson_id: @lesson.id).first
  end

  def new_project
    Project.new
  end

  def decorated_lesson
    LessonDecorator.new(lesson)
  end

  def lesson
    Lesson.friendly.find(params[:id])
  end
end
