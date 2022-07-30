# All Kramdown methods that can be overridden are listed here: https://kramdown.gettalong.org/rdoc/Kramdown/Converter/Html.html
require 'kramdown/converter/html'

module Kramdown
  module Converter
    module OdinHtml
      LEVEL_THREE_HEADER = 3
      EXTERNAL_LINK_ATTRIBUTES = { target: '_blank', rel: 'noopener noreferrer' }.freeze

      def convert_img(element, _indent)
        return super if @stack.last.type == :a

        attributes = { href: element.attr['src'] }.merge(EXTERNAL_LINK_ATTRIBUTES)
        %(<a#{html_attributes(attributes)}>#{super}</a>)
      end

      def convert_a(element, indent)
        if element.attr['href'].starts_with?('http')
          element.attr.merge!(EXTERNAL_LINK_ATTRIBUTES)
          super(element, indent)
        else
          super
        end
      end

      def convert_header(element, indent)
        if element.options[:level] == LEVEL_THREE_HEADER
          section_anchor = "##{generate_id(element.options[:raw_text]).parameterize}"
          body = "<a#{html_attributes({ href: section_anchor, class: 'anchor-link' })}>#{inner(element, indent)}</a>"

          format_as_block_html('h3', element.attr, body, indent)
        else
          super
        end
      end
    end
  end
end

Kramdown::Converter::Html.prepend(Kramdown::Converter::OdinHtml)
