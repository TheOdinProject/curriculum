class MarkdownConverter
  def initialize(markdown)
    @markdown = markdown
  end

  def as_html
    Kramdown::Document.new(markdown).to_html
  end

  private

  attr_reader :markdown
end
