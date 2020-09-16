class ProjectSubmissionSerializer
  def initialize(project_submission)
    @project_submission = project_submission
  end

  def self.as_json(project_submission)
    new(project_submission).as_json
  end

  def as_json(_options = nil)
    {
      id: project_submission.id,
      repo_url: project_submission.repo_url,
      live_preview_url: project_submission.live_preview_url,
      is_public: project_submission.is_public,
      user_name: project_submission.user.username,
      user_id: project_submission.user.id,
    }
  end

  private

  attr_reader :project_submission
end
