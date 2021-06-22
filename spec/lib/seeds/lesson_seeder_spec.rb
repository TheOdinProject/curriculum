require './lib/seeds/lesson_seeder'
require 'rails_helper'

RSpec.describe Seeds::LessonSeeder do
  subject(:lesson_seeder) { described_class.create(section, position, attributes) }

  let(:section) { create(:section, course: course) }
  let(:course) { create(:course) }
  let(:position) { 1 }
  let(:attributes) do
    {
      title: 'Ruby Lesson',
      identifier_uuid: 'lesson_uuid',
      description: 'lesson description',
      url: '/github/lesson_path',
      is_project: true,
      accepts_submission: true,
      has_live_preview: true,
    }
  end

  describe '.create' do
    it 'creates a new lesson' do
      expect { lesson_seeder }.to change { Lesson.count }.from(0).to(1)
    end

    it 'creates a lesson with the given title' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.title).to eq('Ruby Lesson')
    end

    it 'creates a lesson with the given description' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.description).to eq('lesson description')
    end

    it 'creates a lesson with the given position' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.position).to eq(1)
    end

    it 'creates a lesson with a true is_project attribute' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.is_project).to be(true)
    end

    it 'creates a lesson with a true accepts_submission attribute' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.accepts_submission).to be(true)
    end

    it 'creates a lesson with a true has_live_preview attribute' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.has_live_preview).to be(true)
    end

    context 'when optional attributes are not present' do
      let(:attributes) do
        {
          title: 'Ruby Lesson',
          identifier_uuid: 'lesson_uuid',
          description: 'lesson description',
          url: '/github/lesson_path',
        }
      end

      it 'creates a lesson with a false is_project attribute' do
        lesson_seeder

        lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
        expect(lesson.is_project).to be(false)
      end

      it 'creates a lesson with a false accepts_submission attribute' do
        lesson_seeder

        lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
        expect(lesson.accepts_submission).to be(false)
      end

      it 'creates a lesson with a false has_live_preview attribute' do
        lesson_seeder

        lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
        expect(lesson.has_live_preview).to be(false)
      end
    end

    it 'creates a lesson with the given url' do
      lesson_seeder

      lesson = Lesson.find_by(identifier_uuid: 'lesson_uuid')
      expect(lesson.url).to eq('/github/lesson_path')
    end

    context 'when the lesson already exists' do
      it 'updates the attributes that are different' do
        existing_lesson = create(
          :lesson,
          identifier_uuid: 'lesson_uuid',
          title: 'JS Lesson',
          position: 2,
          section: section,
          course_id: course.id,
        )

        expect { lesson_seeder }.to change { existing_lesson.reload.title }
          .from('JS Lesson').to('Ruby Lesson')
          .and change { existing_lesson.position }.from(2).to(1)
      end
    end
  end
end
