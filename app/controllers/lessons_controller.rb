class LessonsController < ApplicationController
  before_action :set_user

  def show
    @lesson = decorated_lesson
    @project_submissions = project_submissions
  end

  private

  def set_user
    return unless user_signed_in?

    @user = User.includes(:completed_lessons).find(current_user.id)
  end

  def project_submissions
    ::LessonProjectSubmissionsQuery.new(@lesson, limit: 10).with_current_user_submission_first(current_user)
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
