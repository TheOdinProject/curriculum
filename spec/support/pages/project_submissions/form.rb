module Pages
  module ProjectSubmissions
    class Form
      extend Dry::Initializer
      include Capybara::DSL

      option :repo_url, default: -> { 'https://github.com/myname/my-project' }
      option :live_preview_url, default: -> { 'https://myprojectlivepreview.com' }

      def self.fill_in_and_submit(**args)
        new(**args)
          .open
          .fill_in
          .submit
          .close
      end

      def open
        find(:test_id, 'add_submission_btn').click
        self
      end

      def fill_in
        find(:test_id, 'repo-url-field').fill_in(with: @repo_url)
        find(:test_id, 'live-preview-url-field').fill_in(with: @live_preview_url)
        self
      end

      def make_private
        find(:test_id, 'is-public-toggle-slider').click
        self
      end

      def submit
        find(:test_id, 'submit-btn').click
        self
      end

      def delete
        find(:test_id, 'delete-btn').click
        self
      end

      def close
        find(:test_id, 'close-btn').click
      end
    end
  end
end
