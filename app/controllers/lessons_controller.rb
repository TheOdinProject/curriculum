class LessonsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def show
    @lesson = decorated_lesson

    return unless show_ads?
    @lower_banner_ad = true
    @right_box_ad = true
  end

  private

  def show_ads?
    ENV['SHOW_ADS'] && Ad.show_ads?
  end

  def decorated_lesson
    LessonDecorator.new(lesson)
  end

  def lesson
    Lesson.friendly.find(params[:id])
  end
end
