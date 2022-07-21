require './lib/kramdown/content_section'

class Kramdown::Converter::HtmlSections < Kramdown::Converter::Html
  H3_HEADER = 3
  TOP_LEVEL_ELEMENT = 0

  def convert(element, _indent = -@indent)
    @content_sections = []
    super
    @content_sections
  end

  def convert_header(element, indent)
    if element.options[:level].to_i == H3_HEADER && indent == TOP_LEVEL_ELEMENT
      @content_sections << Kramdown::ContentSection.new(
        title: generate_id(element.options[:raw_text]),
        header_location: element.options[:location]
      )
    end

    super
  end
end
