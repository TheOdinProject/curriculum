class CompleteButtonComponent < ViewComponent::Base
  def initialize(lesson:, current_user:)
    @lesson = lesson
    @current_user = current_user
  end

  private

  attr_reader :lesson, :current_user

  def text
    lesson_completed? ? 'Lesson Completed' : 'Mark Complete'
  end

  def lesson_completed?
    @lesson_completed ||= current_user.completed?(lesson)
  end
end
