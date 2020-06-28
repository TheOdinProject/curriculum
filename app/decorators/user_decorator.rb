class UserDecorator < ApplicationDecorator
  def has_projects?
    projects.exists?
  end

  def lesson_completions_for(course)
    CompletedLessons.new(course, user).for_course
  end

  def projects_with_lesson
    projects.includes(:lesson)
  end

  private

  def user
    __getobj__
  end
end
