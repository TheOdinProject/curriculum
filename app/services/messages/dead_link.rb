module Messages
  class DeadLink
    include Rails.application.routes.url_helpers

    attr_reader :flag

    def initialize(flag)
      @flag = flag
    end

    def title
      "One of your submissions has been flagged on #{flagged_date}"
    end

    def content
      "Hey #{username}, your project #{lesson_name} has a broken link in your submission. " \
        "Please update it by #{submission_deletion_date} so it doesn\'t get removed!"
    end

    def url
      lesson_url(flag.project_submission.lesson, only_path: true)
    end

    private

    def flagged_date
      flag.created_at.strftime('%d %b %Y')
    end

    def username
      flag.project_submission.user.username
    end

    def lesson_name
      flag.project_submission.lesson.title
    end

    def submission_deletion_date
      7.days.from_now.strftime('%d %b %Y')
    end
  end
end
