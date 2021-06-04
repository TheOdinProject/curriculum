module Admin
  module Flags
    class BanUser
      def initialize(admin:, flag:)
        @admin = admin
        @flag = flag
        @success = false
      end

      def self.call(**args)
        new(**args).call
      end

      def call
        flag.transaction do
          update_flag_for_ban
          @success = true
        end

        self
      end

      def success?
        @success
      end

      private

      attr_reader :flag, :admin

      def update_flag_for_ban
        flag.project_submission.update!(banned: true)
        flag.project_submission.user.update!(banned: true)
        flag.ban!
        flag.resolved!
        flag.update!(resolved_by_id: admin.id)
      end
    end
  end
end
