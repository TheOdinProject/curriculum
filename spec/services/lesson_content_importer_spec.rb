require 'rails_helper'

RSpec.describe LessonContentImporter do
  subject(:importer) { described_class.new(lesson) }

  let(:lesson) do
    create(:lesson, content: lesson_content, title: 'Ruby Basics', github_path: '/ruby_basics/variables')
  end

  let(:lesson_content) { "<p>Hello World</p>\n" }
  let(:lesson_content_from_github) { { content: '"\u001D\xE9e\xA1j+\x95"' } }
  let(:decoded_lesson_content) { 'Hello World!' }

  before do
    allow(Octokit).to receive(:contents)
      .with('theodinproject/curriculum', path: '/ruby_basics/variables')
      .and_return(lesson_content_from_github)

    allow(Base64).to receive(:decode64).and_return(decoded_lesson_content)
    allow(decoded_lesson_content).to receive(:force_encoding).and_return(decoded_lesson_content)
  end

  describe '.import_all' do
    it 'updates the content for all lessons' do
      lessons = create_list(:lesson, 3)
      allow(described_class).to receive(:for)

      described_class.import_all

      expect(described_class).to have_received(:for).thrice
    end
  end

  describe '#import' do
    it 'updates the lesson content' do
      expect { importer.import }.to change { lesson.reload.content }.to("<p>Hello World!</p>\n")
    end

    context 'when lesson content is the same as the github content' do
      let(:decoded_lesson_content) { 'Hello World' }

      it 'does not update the lesson content' do
        expect { importer.import }.not_to change { lesson.reload.content }
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

        allow(Rails.logger).to receive(:error)
      end

      it 'logs the error' do
        importer.import

        expect(Rails.logger).to have_received(:error).with(
          "Failed to import 'Ruby Basics' message: GET : 403 - Error: problem"
        )
      end
    end
  end
end
