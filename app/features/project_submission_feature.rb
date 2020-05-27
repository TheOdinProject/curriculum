class ProjectSubmissionFeature
  def self.enabled?
    Rails.env.development?
  end
end
