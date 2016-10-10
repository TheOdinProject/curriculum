require 'spec_helper'

RSpec.describe MarkdownConverter, :type => :service do
  subject(:markdown_converter) { MarkdownConverter.new(markdown) }

  let(:markdown) { 'Some markdown' }
  let(:redcarpet_markdown) { double('Redcarpet::Markdown') }
  let(:markdown_extensions) { { :fenced_code_blocks => true } }

  before do
    allow(Redcarpet::Markdown).to receive(:new).
      with(Redcarpet::Render::HTML, extentions = markdown_extensions).
      and_return(redcarpet_markdown)

    allow(redcarpet_markdown).to receive(:render).with(markdown).
      and_return('<p>Some markdown</p>')
  end

  describe '#as_html' do
    it 'returns html' do
      expect(markdown_converter.as_html).to eql('<p>Some markdown</p>')
    end
  end
end
