require 'rails_helper'

RSpec.describe LessonContentImporter do
  subject { described_class.new(lesson) }

  let(:lesson) do
    create(:lesson, content: lesson_content, title: 'Ruby Basics', url: '/ruby_basics/variables')
  end

  let(:lesson_content) { "<p>Hello World</p>\n" }
  let(:lesson_content_from_github) { { content: '"\u001D\xE9e\xA1j+\x95"' } }
  let(:decoded_lesson_content) { 'Hello World!' }

  before do
    allow(Octokit).to receive(:contents)
      .with('theodinproject/curriculum', path: '/ruby_basics/variables')
      .and_return(lesson_content_from_github)

    allow(Base64).to receive_message_chain(:decode64, :force_encoding)
      .and_return(decoded_lesson_content)
  end

  describe '.import_all' do
    let(:lessons) { create_list(:lesson, 3) }

    before do
      lessons
    end

    it 'updates the content for all lessons' do
      expect(described_class).to receive(:for).thrice
      described_class.import_all
    end
  end

  describe '#import' do
    it 'updates the lesson content' do
      expect { subject.import }.to change { lesson.reload.content }.to("<p>Hello World!</p>\n")
    end

    context 'when lesson content is the same as the github content' do
      let(:decoded_lesson_content) { 'Hello World' }

      it 'does not update the lesson content' do
        expect { subject.import }.not_to change { lesson.reload.content }
      end
    end

    context 'when there is an error with octokit' do
      before do
        allow(Octokit).to receive(:contents)
          .with('theodinproject/curriculum', path: '/ruby_basics/variables')
          .and_raise(
            Octokit::Error.new(
              method: 'GET',
              status: '403',
              body: { error: 'problem' }
            )
          )
      end

      it 'logs the error' do
        expect(Rails).to receive_message_chain(:logger, :error)
          .with("Failed to import 'Ruby Basics' message: GET : 403 - Error: problem")

        subject.import
      end
    end
  end
end
