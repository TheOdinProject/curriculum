class LessonProjectSubmissionsQuery
  def initialize(lesson:, current_user:, limit: nil)
    @lesson = lesson
    @current_user = current_user
    @limit = limit
  end

  def current_user_submission
    return if current_user.nil?

    current_user.project_submissions.not_removed_by_admin.find_by(lesson: lesson)
  end

  def public_submissions
    lesson.project_submissions
          .only_public
          .not_removed_by_admin
          .where.not(user: current_user)
          .order(cached_votes_total: :desc, created_at: :desc)
          .limit(limit)
  end

  private

  attr_reader :lesson, :limit, :current_user
end
