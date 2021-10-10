namespace :project_submissions do
  desc 'Discard discardable project submissions'
  task discard: :environment do
    DiscardProjectSubmissionJob.new.perform
  end
end
