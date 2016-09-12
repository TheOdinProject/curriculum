require 'spec_helper'

describe ChatLinkFactory do
  subject(:chat_link_factory) { ChatLinkFactory.new(course) }
  let(:course) { double('Course', title: course_title) }
  let(:base_url) { 'https://gitter.im/TheOdinProject/' }

  describe '#build' do
    let(:course_title) { 'Introduction to Web Development' }

    it 'builds a link to chat based on the course title' do
      expect(chat_link_factory.build).to eql(base_url + 'Introduction-to-web-development')
    end

    context 'when a course does not have a white listed title' do
      let(:course_title) { 'foo bar' }

      it 'falls back to general' do
        expect(chat_link_factory.build).to eql(base_url + 'theodinproject')
      end
    end
  end
end
