module Admin
  module Flags
    class NotifyUser
      def initialize(admin:, flag:, notification:)
        @admin = admin
        @flag = flag
        @notification = notification
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
          FlagNotification.with(flag: flag, message: message.content, url: message.url)
                          .deliver_later(flag.project_submission.user)
        end
      end
      # rubocop:enable Metrics/AbcSize

      private

      attr_reader :flag, :admin, :notification

      def message
        Messages::DeadLink.new(flag)
      end
    end
  end
end
