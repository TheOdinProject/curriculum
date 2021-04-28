module Admin
  module Flags
    class BanUser
      def initialize(flag:)
        @flag = flag
        @success = false
      end

      def self.call(*args)
        new(*args).call
      end

      def call
        flag.transaction do
          flag.project_submission.update!(banned: true)
          flag.project_submission.user.update!(banned: true)
          flag.ban!
          flag.resolved!
          flag.update!(resolved_by_id: flag.flagger.id)
          @success = true
        end

        self
      end

      def success?
        @success
      end

      private

      attr_reader :flag
    end
  end
end
