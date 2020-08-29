module Notifications
  class FlagSubmission
    def initialize(params)
      @flagger = params[:flagger]
      @project_submission = params[:project_submission]
      @reason = params[:reason]
    end

    def message
      "#{@flagger.username} has flagged #{@project_submission.id}\n" \
      "Reason: #{@reason}"
    end

    def destination
      ENV['DISCORD_FLAGGED_SUBMISSIONS_CHANNEL']
    end
  end
end
