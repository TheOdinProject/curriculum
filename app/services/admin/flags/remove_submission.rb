module Admin
  module Flags
    class RemoveSubmission
      def initialize(admin:, flag:)
        @admin = admin
        @flag = flag
        @success = false
      end

      def self.call(**args)
        new(**args).call
      end

      def call
        flag.project_submission.discard
        flag.removed_project_submission!
        flag.resolved!
        flag.update!(resolved_by_id: admin.id)
        @success = true

        self
      end

      def success?
        @success
      end

      private

      attr_reader :flag, :admin
    end
  end
end
