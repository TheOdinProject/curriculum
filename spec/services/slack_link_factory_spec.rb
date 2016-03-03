require 'spec_helper'

describe SlackLinkFactory do
  subject(:slack_link_adaptor) { SlackLinkFactory.new(course) }
  let(:course) { double('Course', title: course_title) }
  let(:base_url) { 'https://theodinproject.slack.com/messages' }

	describe '#build' do
    let(:course_title) { 'Introduction to Web Development' }

    it 'builds a link to slack based on the course title' do
      expect(slack_link_adaptor.build).to eql(base_url + '/1-intro-to-web-dev/')
    end

    context 'when a course does not have a white listed title' do
      let(:course_title) { 'foo bar' }

      it 'falls back to general' do
        expect(slack_link_adaptor.build).to eql(base_url + '/general/')
      end
    end
	end
end