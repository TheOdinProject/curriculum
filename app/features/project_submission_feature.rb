class ProjectSubmissionFeature
  def self.enabled?
    Rails.env.development? || Rails.env.staging?
  end
end
