class LessonsController < ApplicationController
  before_action :set_user

  def show
    @lesson = decorated_lesson
    @projects = projects.map { |project| ProjectSerializer.as_json(project) }
  end

  private

  def set_user
    if user_signed_in?
      @user = User.includes(:completed_lessons).find(current_user.id)
    end
  end

  def projects
   (user_project + lesson.projects.with_no_active_reports.limit(10)).uniq
  end

  def user_project
    return [] unless current_user

    current_user.projects.where(lesson_id: @lesson.id)
  end

  def decorated_lesson
    LessonDecorator.new(lesson)
  end

  def lesson
    Lesson
      .includes(:section, course: [:lessons, sections: [:lessons]])
      .friendly
      .find(params[:id])
  end
end
