class MarkdownConverter
  attr_reader :markdown
  private :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def as_html
    converted_markdown
  end

  private

  def converted_markdown
    Kramdown::Document.new(markdown).to_html
  end
end
