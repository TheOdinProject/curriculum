require 'rails_helper'

RSpec.describe LessonContentImporter do
  subject { LessonContentImporter.new(lesson) }

  let(:lesson) do
    double(
      'Lesson',
      content: lesson_content,
      title: 'Ruby Basics',
      repo: 'ruby_course',
      url: '/ruby_basics/variables'
    )
  end

  let(:lesson_content) { '<p>Hello World</p>' }
  let(:lesson_content_from_github) { { content: '"\u001D\xE9e\xA1j+\x95"' } }
  let(:decoded_lesson_content) { 'Hello World!' }

  let(:markdown_converter) do
    double(
      'MarkdownConverter',
      as_html: '<p>Hello World!</p>'
    )
  end

  before do
    allow(Octokit).to receive(:contents).
      with('theodinproject/ruby_course', path: '/ruby_basics/variables').
        and_return(lesson_content_from_github)

    allow(Base64).to receive_message_chain(:decode64, :force_encoding)
      .and_return(decoded_lesson_content)

    allow(MarkdownConverter).to receive(:new).with(decoded_lesson_content).
      and_return(markdown_converter)
  end

  describe '#import' do

    it 'updates the lesson content' do
      expect(lesson).to receive(:update!).with(content: '<p>Hello World!</p>')
      subject.import
    end

    context 'when lesson content is the same as the github content' do
      let(:decoded_lesson_content) { 'Hello World' }

      it 'does not update the lesson content' do
        expect(lesson).not_to receive(:update!).
          with(content: '<p>Hello World</p>')

        subject.import
      end
    end

    context 'when there is an error with octokit' do
      before do
        allow(Octokit).to receive(:contents).
          with('theodinproject/ruby_course', path: '/ruby_basics/variables').
          and_raise(Octokit::Error.new(
            method: 'GET',
            status: '403',
            body: { error: 'problem' }
          ))
      end

      it 'logs the error' do
        expect(Rails).to receive_message_chain(:logger, :error).
          with("Failed to import 'Ruby Basics' message: GET : 403 - Error: problem")

        subject.import
      end
    end

    context 'when there is an error with the lesson object' do
      let(:lesson) do
        Lesson.new(
          title: 'Ruby Basics',
          repo: 'ruby_course',
          url: '/ruby_basics/variables'
        )
      end

      it 'logs the error' do
        expect(Rails).to receive_message_chain(:logger, :error).
          with("Failed to import 'Ruby Basics' message: [\"Position can't be blank\"]")
        subject.import
      end
    end
  end
end
