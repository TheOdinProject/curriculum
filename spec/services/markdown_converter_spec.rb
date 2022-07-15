require 'rails_helper'
require './lib/kramdown/document_sections'

RSpec.describe MarkdownConverter do
  describe '#as_html' do
    it 'converts the markdown to html with sections' do
      markdown = <<~MARKDOWN
        # First header
        Test first header

        ## Second header
        Test second header

        ### Third header
        Test third header
      MARKDOWN

      result = <<~HTML
        <section id="content" class="scrollspy">
          <h1 id="first-header">First header</h1>
          <p>Test first header</p>

          <h2 id="second-header">Second header</h2>
          <p>Test second header</p>

        </section>
        <section id="third-header" class="scrollspy">
          <h3 id="third-header">Third header</h3>
          <p>Test third header</p>
        </section>
      HTML

      expect(described_class.new(markdown).as_html).to eq(result)
    end

    context 'when the markdown does not have any sections' do
      it 'converts the markdown to html without sections' do
        markdown = 'some content'

        expect(described_class.new(markdown).as_html).to eq("<p>some content</p>\n")
      end
    end
  end
end
