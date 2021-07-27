module Messages
  class DeadLink
    include Rails.application.routes.url_helpers

    attr_reader :flag

    def initialize(flag)
      @flag = flag
    end

    # rubocop:disable Layout/LineLength
    def content
      "Hey #{username}, heads up your project submission for #{lesson_name} was flagged because it has a broken link. " \
        'We aim to keep the submission lists useful and so we remove any submissions with broken links often. ' \
        'When you get a moment, can you update your submission with the correct links for us please? ' \
        "Otherwise we will have to remove it on #{date}."
    end
    # rubocop:enable Layout/LineLength

    def url
      lesson_url(flag.project_submission.lesson, only_path: true)
    end

    private

    def username
      flag.project_submission.user.username
    end

    def lesson_name
      flag.project_submission.lesson.title
    end

    def date
      7.days.from_now.strftime('%d %b %Y')
    end
  end
end
