class DiscardProjectSubmissionJob
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: false

  def perform
    ProjectSubmission.discardable.each(&:discard!)
  end
end
