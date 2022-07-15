require './lib/kramdown/document_sections'

class MarkdownConverter
  def initialize(markdown)
    @markdown = markdown
  end

  def as_html
    sections = Kramdown::DocumentSections.new(markdown).all_sections

    if sections.any?
      sections.map { |section| Kramdown::Document.new(section.content).to_html }.join
    else
      Kramdown::Document.new(markdown).to_html
    end
  end

  private

  attr_reader :markdown
end
