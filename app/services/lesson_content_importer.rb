class LessonContentImporter
  attr_reader :lesson
  private :lesson

  def initialize(lesson)
    @lesson = lesson
  end

  def self.for(lesson)
    new(lesson).import
  end

  def self.import_all
    total = Lesson.count

    Rails.logger.info 'Importing lesson content...'

    Lesson.all.each_with_index do |lesson, i|
      Rails.logger.info "Importing #{i+1}/#{total}: #{lesson.title}"
      self.for(lesson)
    end

    Rails.logger.info 'Lesson content import complete.'
  end

  def import
    lesson.update(content: content_converted_to_html) if content_needs_updated?
  rescue Octokit::Error => errors
    failed_to_import_message
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

  def failed_to_import_message
    Rails.logger.error "Failed to import \"#{lesson.title}\" content: #{lesson.errors}"
    false
  end

  def repo
    "theodinproject/#{lesson.repo}"
  end
end
