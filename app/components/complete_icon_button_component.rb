class CompleteIconButtonComponent < ViewComponent::Base
  def initialize(lesson:, current_user:)
    @lesson = lesson
    @current_user = current_user
  end

  def render?
    current_user.present?
  end

  private

  attr_reader :lesson, :current_user

  def lesson_completed?
    @lesson_completed ||= current_user.completed?(lesson)
  end
end
