require 'rails_helper'

RSpec.describe MarkdownConverter do
  describe '#as_html' do
    it 'returns html' do
      markdown = 'Some markdown'
      markdown_converter = described_class.new(markdown)

      expect(markdown_converter.as_html).to eql("<p>Some markdown</p>\n")
    end
  end
end
