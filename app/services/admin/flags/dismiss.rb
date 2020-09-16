module Admin
  module Flags
    class Dismiss
      def initialize(flag:)
        @flag = flag
        @success = false
      end

      def self.call(*args)
        new(*args).call
      end

      def call
        flag.resolved!
        flag.dismiss!
        @success = true

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
