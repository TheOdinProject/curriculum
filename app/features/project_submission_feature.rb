class ProjectSubmissionFeature
  def self.enabled?
    Rails.env.development? || ENV['STAGING'].present?
  end
end
