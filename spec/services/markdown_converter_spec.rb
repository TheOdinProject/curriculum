require 'rails_helper'

RSpec.describe MarkdownConverter do
  subject(:markdown_converter) { described_class.new(markdown) }

  let(:markdown) { 'Some markdown' }
  let(:kramdown) do
    double(
      'Kramdown::Document',
      to_html: '<p>Some markdown</p>'
    )
  end

  before do
    allow(Kramdown::Document).to receive(:new).with(markdown).and_return(kramdown)
  end

  describe '#as_html' do
    it 'returns html' do
      expect(markdown_converter.as_html).to eql('<p>Some markdown</p>')
    end
  end
end
