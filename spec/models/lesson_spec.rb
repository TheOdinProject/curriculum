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

  let(:find_lesson) { double('FindLesson') }
  let(:section) { double('Section', lessons: lessons) }
  let(:lessons) { [] }

  before do
    allow(lesson).to receive(:section).and_return(section)
    allow(lesson).to receive(:course).and_return(course)
    allow(FindLesson).to receive(:new).with(lesson).and_return(find_lesson)
  end

  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users) }
  it { is_expected.to validate_uniqueness_of(:position).case_insensitive }
  it { is_expected.to validate_presence_of(:content).on(:update) }

  describe '#next_lesson' do
    it 'returns the next lesson' do
      expect(find_lesson).to receive(:next_lesson)
      lesson.next_lesson
    end
  end

  describe '#prev_lesson' do
    it 'find the previous lesson' do
      expect(find_lesson).to receive(:prev_lesson)
      lesson.prev_lesson
    end
  end

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
    it 'updates the lessons content' do
      VCR.use_cassette('lesson_content') { lesson.import_content_from_github }
      expect(lesson.reload.content).not_to be nil
    end

    context 'when the lesson content has not changed' do
      it 'does not update the lesson content' do
        VCR.use_cassette('lesson_content') { lesson.import_content_from_github }
        expect(lesson).not_to receive(:update)
        VCR.use_cassette('lesson_content') { lesson.import_content_from_github }
      end
    end

    context 'when Octokit raises an error' do
      let(:logger) { double('Logger') }

      before do
        allow(Octokit).to receive(:contents)
          .with('theodinproject/curriculum', path: '/README.md')
          .and_raise(Octokit::Error)

        allow(lesson).to receive(:errors).and_return('there was a problem')
        allow(lesson).to receive(:logger).and_return(logger)

        allow(logger).to receive(:error)
          .with('Failed to import "test_lesson" content: there was a problem')
      end

      it 'returns false' do
        expect(lesson.import_content_from_github).to eql(false)
      end

      it 'logs a failure message' do
        expect(logger).to receive(:error)
          .with('Failed to import "test_lesson" content: there was a problem')
        lesson.import_content_from_github
      end
    end
  end
end
