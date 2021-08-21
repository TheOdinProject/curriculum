module Admin
  module Flags
    class NotifyUser
      def initialize(admin:, flag:)
        @admin = admin
        @flag = flag
        @success = false
      end

      def self.call(**args)
        new(**args).call
      end

      # rubocop:disable Metrics/AbcSize
      def call
        flag.transaction do
          flag.notified_user!
          flag.resolved!
          flag.update!(resolved_by_id: admin.id)
          FlagNotification.with(flag: flag, title: message.title, message: message.content, url: message.url)
                          .deliver_later(flag.project_submission.user)
          flag.project_submission.update(discard_at: 7.days.from_now)
          @success = true
        end

        self
      end
      # rubocop:enable Metrics/AbcSize

      def success?
        @success
      end

      private

      attr_reader :flag, :admin

      def message
        Messages::DeadLink.new(flag)
      end
    end
  end
end
