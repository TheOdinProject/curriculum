class ProjectSubmissionSerializer
  include Rails.application.routes.url_helpers

  def initialize(project_submission)
    @project_submission = project_submission
  end

  def self.as_json(project_submission)
    new(project_submission).as_json
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
      lesson_path: lesson_path(lesson),
      lesson_has_live_preview: lesson.has_live_preview,
    }
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  attr_reader :project_submission

  def lesson
    project_submission.lesson
  end
end
