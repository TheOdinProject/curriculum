module Notifications
  class FlagSubmission
    delegate :flagger, :project_submission, :reason, to: :flag, private: true

    def initialize(flag)
      @flag = flag
    end

    def message
      "#{flagger.username} has flagged a submission on #{project_submission.lesson.title}\n" \
      "Reason: #{reason}\n" \
      "Resolve the flag here: https://www.theodinproject.com/admin/flags/#{flag.id}"
    end

    def destination
      ENV['DISCORD_FLAGGED_SUBMISSIONS_CHANNEL']
    end

    private

    attr_reader :flag
  end
end
