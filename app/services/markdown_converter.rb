class MarkdownConverter
  attr_reader :markdown
  private :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def as_html
    markdown_converter.render(markdown).html_safe
  end

  private

  def markdown_converter
    Redcarpet::Markdown.new(renderer, extensions = markdown_extensions)
  end

  def renderer
    Redcarpet::Render::HTML
  end

  def markdown_extensions
    { :fenced_code_blocks => true }
  end
end
