require './lib/kramdown/converter/html_sections'
require './lib/kramdown/content_section'

class Kramdown::DocumentSections < Kramdown::Document
  START_OF_CONTENT = 0
  END_OF_CONTENT = -1

  def initialize(source, options = {})
    @source = source
    super
  end

  def all_sections
    return [] if sections.none?

    [
      unsectionable_content,
      sectionable_content
    ].flatten.compact
  end

  private

  def sections
    @sections ||= Kramdown::Converter::HtmlSections.convert(@root, @options).first
  end

  def unsectionable_content
    return if sections.any? && sections.any?(&:start_of_document?)

    Kramdown::ContentSection.new(
      title: 'content', content: content_between(START_OF_CONTENT, end_of_unsectionable_content)
    )
  end

  def end_of_unsectionable_content
    return END_OF_CONTENT if sections.none?

    sections.first.end_of_previous_section
  end

  def sectionable_content
    sections.map.with_index do |section, index|
      next_section = sections[index + 1]

      if next_section.present?
        Kramdown::ContentSection.new(
          title: section.title, content: content_between(section.start, next_section.end_of_previous_section)
        )
      else
        Kramdown::ContentSection.new(title: section.title, content: content_between(section.start, END_OF_CONTENT))
      end
    end
  end

  def content_between(first_line, last_line)
    @source.lines.to_a[first_line..last_line].join
  end
end
