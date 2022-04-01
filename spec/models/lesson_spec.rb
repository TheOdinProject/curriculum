require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) { create(:lesson) }

  it { is_expected.to belong_to(:section) }
  it { is_expected.to have_one(:course).through(:section) }
  it { is_expected.to have_many(:project_submissions) }
  it { is_expected.to have_many(:lesson_completions) }
  it { is_expected.to have_many(:completing_users).through(:lesson_completions) }

  it { is_expected.to validate_presence_of(:position) }

  describe '.most_recent_updated_at' do
    before do
      travel_to Time.utc(2021, 4, 14)
    end

    after do
      travel_back
    end

    it 'returns the most recently updated_at time stamp' do
      create(:lesson, updated_at: 2.weeks.ago)
      create(:lesson, updated_at: 1.week.ago)
      create(:lesson, updated_at: Time.utc(2021, 4, 10, 15))

      expect(described_class.most_recent_updated_at).to eql(Time.utc(2021, 4, 10, 15))
    end
  end

  describe '.installation_lessons' do
    it 'returns all the installation lessons' do
      installation_lesson_one = create(:lesson, installation_lesson: true)
      installation_lesson_two = create(:lesson, installation_lesson: true)
      create(:lesson, installation_lesson: false)

      expect(described_class.installation_lessons).to contain_exactly(
        installation_lesson_one, installation_lesson_two
      )
    end
  end

  describe 'slug' do
    it 'returns the course and lesson title as the slug' do
      course = create(:course, title: 'course title')
      lesson = create(:lesson, title: 'lesson title', course: course)

      expect(lesson.slug).to eql('course-title-lesson-title')
    end

    context 'when lesson is shared across paths' do
      it 'returns the path, course and lesson title as the slug' do
        path = create(:path, short_title: 'path title')
        course = create(:course, title: 'course title', path: path)
        create(:lesson, title: 'lesson title', course: course)
        shared_lesson = create(:lesson, title: 'lesson title', course: course)

        expect(shared_lesson.slug).to eql('path-title-course-title-lesson-title')
      end
    end

    context 'when path and course title are the same' do
      it 'returns the just the course and lesson title as the slug' do
        path = create(:path, short_title: 'foundations')
        course = create(:course, title: 'foundations', path: path)
        lesson = create(:lesson, title: 'lesson title', course: course)

        expect(lesson.slug).to eql('foundations-lesson-title')
      end
    end

    context 'when course and lesson title are the same' do
      it 'returns the just the course and lesson title as the slug' do
        path = create(:path, short_title: 'path title')
        course = create(:course, title: 'databases', path: path)
        lesson = create(:lesson, title: 'databases', course: course)

        expect(lesson.slug).to eql('databases')
      end
    end

    context 'when three or more lessons share the same slug canidates' do
      before do
        allow(SecureRandom).to receive(:hex).with(2).and_return('1234')
      end

      it 'returns default slug canidate post fixed with the random hex' do
        path = create(:path, short_title: 'path title')
        course = create(:course, title: 'course title', path: path)
        create(:lesson, title: 'lesson title', course: course)
        create(:lesson, title: 'lesson title', course: course)
        lesson_three = create(:lesson, title: 'lesson title', course: course)

        expect(lesson_three.slug).to eql('path-title-course-title-lesson-title-1234')
      end
    end
  end

  describe '#position_in_section' do
    let(:section) { create(:section) }
    let(:first_lesson) { create(:lesson, position: 1, section: section) }
    let(:second_lesson) { create(:lesson, position: 2, section: section) }
    let(:third_lesson) { create(:lesson, position: 3, section: section) }

    it 'returns the position of the lesson in the section' do
      expect(first_lesson.position_in_section).to eql(1)
      expect(second_lesson.position_in_section).to eql(2)
      expect(third_lesson.position_in_section).to eql(3)
    end
  end

  describe '#import' do
    it 'uses the lesson content importer to get lesson content from github' do
      expect(LessonContentImporter).to receive(:for).with(lesson)
      lesson.import_content_from_github
    end
  end
end
