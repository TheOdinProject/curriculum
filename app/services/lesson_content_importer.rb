class LessonContentImporter
  attr_reader :lesson
  private :lesson

  def initialize(lesson)
    @lesson = lesson
  end

  def self.for(lesson)
    new(lesson).import
  end

  def import
    lesson.update!(content: content_converted_to_html) if content_needs_updated?
  rescue Octokit::Error => error
    log_error(error.message)
  rescue ActiveRecord::RecordInvalid => error
    log_error(error.record.errors.full_messages)
  end

  private

  def content_needs_updated?
    lesson.content != content_converted_to_html
  end

  def content_converted_to_html
    @content_converted_to_html ||= MarkdownConverter.new(decoded_content).as_html
  end

  def decoded_content
    Base64.decode64(github_response[:content]).force_encoding("UTF-8")
  end

  def github_response
    Octokit.contents(repo, path: lesson.url)
  end

  def log_error(message)
    Rails.logger.error "Failed to import '#{lesson.title}' message: #{message}"
    false
  end

  def repo
    "theodinproject/#{lesson.repo}"
  end
end
