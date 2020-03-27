require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) { described_class.new }

  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users) }
  it { is_expected.to validate_presence_of(:position) }

  describe '#position_in_section' do
    let(:lesson) { create(:lesson) }
    let(:other_lesson) { create(:lesson) }
    let(:section) { create(:section, lessons: [other_lesson, lesson])}

    before do
      section
    end

    it 'returns the position of the lesson in the section' do
      expect(lesson.position_in_section).to eql(2)
    end
  end

  describe '#import' do
    it 'uses the lesson content importer to get lesson content from github' do
      expect(LessonContentImporter).to receive(:for).with(lesson)
      lesson.import_content_from_github
    end
  end
end
