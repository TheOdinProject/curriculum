class LessonsController < ApplicationController

  def index
    @course = find_course
  end

  def show
    @course = find_course
    @lesson = find_lesson

    if show_ads?
      @lower_banner_ad = true
      @right_box_ad = true
    end
  end
  def show_ads?
    ENV["SHOW_ADS"] && Ad.show_ads?(current_user)
  end

  private

  def find_course
    @find_course ||= Course.find_by_title_url(params[:course_name])
  end

  def find_lesson
    @find_lesson ||= find_course.lessons.find_by_title_url(params[:lesson_name])
  end
end
