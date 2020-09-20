class LessonProjectSubmissionsQuery
  def initialize(lesson, limit: nil)
    @lesson = lesson
    @limit = limit
  end

  def with_current_user_submission_first(user)
    return lesson_project_submissions if user.nil?

    (user.project_submissions.where(lesson_id: lesson.id) + lesson_project_submissions).uniq
  end

  private

  attr_reader :lesson, :limit

  def lesson_project_submissions
    lesson.project_submissions.viewable.order(created_at: :desc).limit(limit)
  end
end
