class LessonProjectSubmissionsQuery
  def initialize(lesson, limit: nil)
    @lesson = lesson
    @limit = limit
  end

  def with_current_user_submission_first(user)
    lesson.project_submissions
          .where
          .not(user_id: user&.id)
          .viewable.order(cached_votes_total: :desc, created_at: :desc)
          .limit(limit)
  end

  private

  attr_reader :lesson, :limit
end
