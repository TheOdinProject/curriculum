class LessonsController < ApplicationController
  before_action :set_user

  def show
    @lesson = decorated_lesson
    set_project_and_submissions if @lesson.has_submission?
    set_ads
  end

  private

  def set_user
    if user_signed_in?
      @user = User.includes(:completed_lessons).find(current_user.id)
    end
  end

  def set_ads
    return unless show_ads?
    @lower_banner_ad = true
    @right_box_ad = true
  end

  def show_ads?
    ENV['SHOW_ADS'] && Ad.show_ads?
  end

  def set_project_and_submissions
    @project = set_project
    @projects = set_projects
  end

  def set_projects
    Project.all_submissions(@lesson.id)
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
    Lesson.includes(:section, course: [:lessons, sections: [:lessons]]).friendly.find(params[:id])
  end
end
