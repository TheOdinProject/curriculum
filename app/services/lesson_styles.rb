class LessonStyles
  def initialize(path)
    @path = path
  end

  def self.render_for(path)
    new(path).render
  end

  def render
    MarkdownConverter.new(decoded_content).as_html
  end

  private

  attr_reader :path

  def decoded_content
    Base64.decode64(github_response[:content]).force_encoding('UTF-8')
  end

  def github_response
    Octokit.contents('theodinproject/curriculum', path: "#{lesson_path}?ref=#{blob_id}")
  end

  def blob_id
    path.split('/')[4]
  end

  def lesson_path
    path.split('/')[5..-1].join('/')
  end
end
