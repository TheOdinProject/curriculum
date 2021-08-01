module Users
  class ResetProgress
    def initialize(user)
      @user = user
      @success = false
    end

    def self.call(user)
      new(user).call
    end

    def call
      user.transaction do
        delete_lesson_completions
        reset_default_path unless user.path.default_path?
        @success = true
      end

      self
    end

    def success?
      @success
    end

    private

    attr_reader :user

    def delete_lesson_completions
      user.lesson_completions.delete_all
    end

    def reset_default_path
      user.update(path: Path.default_path)
    end
  end
end
