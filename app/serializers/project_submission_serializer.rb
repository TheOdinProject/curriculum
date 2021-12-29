class ProjectSubmissionSerializer
  include Rails.application.routes.url_helpers

  def initialize(project_submission, current_user)
    @project_submission = project_submission
    @current_user = current_user
  end

  def self.as_json(project_submission, current_user)
    new(project_submission, current_user).as_json
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def as_json(_options = nil)
    {
      id: project_submission.id,
      repo_url: project_submission.repo_url,
      live_preview_url: project_submission.live_preview_url,
      is_public: project_submission.is_public,
      user_name: project_submission.user.username,
      user_id: project_submission.user.id,
      lesson_id: lesson.id,
      lesson_title: lesson.title,
      lesson_path: path_course_lesson_path(lesson.course.path, lesson.course, lesson),
      lesson_has_live_preview: lesson.has_live_preview,
      likes: project_submission.votes_for.size,
      is_liked_by_current_user: current_user.voted_for?(project_submission),
    }
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  attr_reader :project_submission, :current_user

  def lesson
    project_submission.lesson
  end
end
