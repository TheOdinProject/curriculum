require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) {
    Lesson.new(
      title: 'test_lesson',
      position: 1,
      section_id: 2,
      is_project: false,
      url: '/README.md',
      content: nil,
      slug: 'test-lesson'
    )
  }

  let(:course) { double('Course', title: 'web_dev_101') }
  let(:section) { double('Section', lessons: lessons) }
  let(:lessons) { [] }

  before do
    allow(lesson).to receive(:section).and_return(section)
    allow(lesson).to receive(:course).and_return(course)
  end

  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users) }
  it { is_expected.to validate_presence_of(:position) }

  describe '#position_in_section' do
    let(:lessons) { [lesson, lesson2, lesson3] }
    let(:lesson2) { double('Lesson', is_project: false, position: 2) }
    let(:lesson3) { double('Lesson', is_project: true, position: 3) }
    let(:appropiate_lessons) { [lesson, lesson2] }

    before do
      allow(lesson).to receive(:position).and_return(3)
      allow(lessons).to receive(:where)
        .with('position <= ?', 3)
        .and_return(appropiate_lessons)
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
