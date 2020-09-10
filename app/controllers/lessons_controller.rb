class LessonsController < ApplicationController
  before_action :set_user

  def show
    @lesson = decorated_lesson

    @project_submissions = project_submissions.map do |submission|
      ProjectSubmissionSerializer.as_json(submission)
    end
  end

  private

  def set_user
    return unless user_signed_in?

    @user = User.includes(:completed_lessons).find(current_user.id)
  end

  def project_submissions
    (current_users_submission + lesson.project_submissions.viewable.limit(10)).uniq
  end

  def current_users_submission
    return [] unless current_user

    current_user.project_submissions.where(lesson_id: @lesson.id)
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
