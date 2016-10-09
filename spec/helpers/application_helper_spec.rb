require 'rails_helper'

describe ApplicationHelper do

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

  describe 'title' do

    context 'when input is not nil' do
      it 'stores the title in a content_for block' do
        helper.title('Courses')
        expect(helper.content_for(:title)).to eql('Courses | The Odin Project')
      end
    end

    context 'when input is nil' do
      it 'returns nil' do
        expect(title).to be nil
      end
    end

  end
end
