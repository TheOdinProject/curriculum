class ProjectSerializer

  def initialize(project)
    @project = project
  end

  def self.as_json(project)
    new(project).as_json
  end

  def as_json(options=nil)
    {
      id: project.id,
      repo_url: project.repo_url,
      live_preview_url: project.live_preview_url,
      is_public: project.is_public,
      user_name: project.user.username,
      user_id: project.user.id,
    }
  end

  private

  attr_reader :project
end
