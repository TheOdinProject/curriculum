require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#chat_link' do
    it 'returns the chat url' do
      expect(chat_link).to eq('https://gitter.im/TheOdinProject/theodinproject')
    end
  end

  describe 'title' do
    it 'sets the title' do
      helper.title('Courses')
      expect(helper.content_for(:title)).to eql('Courses | The Odin Project')
    end

    context 'when there is no input' do
      it 'returns nil' do
        expect(title).to be nil
      end
    end
  end

  describe 'convert_markdown_to_html' do
    let(:markdown_converter) { double('MarkdownConverter') }

    before do
      allow(MarkdownConverter).to receive(:new).with('Some Markdown')
        .and_return(markdown_converter)

      allow(markdown_converter).to receive(:as_html)
    end

    it 'returns converted html' do
      expect(markdown_converter).to receive(:as_html)
      convert_markdown_to_html('Some Markdown')
    end
  end

  describe '#bootstrap_class_for' do
    let(:flash_type) { 'alert' }

    it 'returns the bootstrap alert class' do
      expect(helper.bootstrap_class_for(flash_type)).to eql('alert-error')
    end

    context 'when flash type is notice' do
      let(:flash_type) { 'notice' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-success')
      end
    end

    context 'when custom flash type' do
      let(:flash_type) { 'error' }

      it 'returns the bootstrap success class' do
        expect(helper.bootstrap_class_for(flash_type)).to eql('alert-error')
      end
    end
  end
end
