class UserDecorator < ApplicationDecorator
  def has_project_submissions?
    project_submissions.any?
  end

  def lesson_completions_for(course)
    CompletedLessons.new(course, user).for_course
  end

  def project_submissions_with_lesson
    project_submissions.includes(:lesson)
  end

  private

  def user
    __getobj__
  end
end
