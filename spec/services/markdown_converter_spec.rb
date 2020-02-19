require 'rails_helper'

RSpec.describe MarkdownConverter, type: :service do
  subject(:markdown_converter) { MarkdownConverter.new(markdown) }

  let(:markdown) { 'Some markdown' }
  let(:kramdown) {
    double(
      'Kramdown::Document',
      to_html: "<p>Some markdown</p>"
     )
   }

  before do
    allow(Kramdown::Document).to receive(:new).with(markdown).
      and_return(kramdown)
  end

  describe '#as_html' do
    it 'returns html' do
      expect(markdown_converter.as_html).to eql('<p>Some markdown</p>')
    end
  end
end
