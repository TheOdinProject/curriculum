require './lib/seeds/course_seeder'
require 'rails_helper'

RSpec.describe Seeds::CourseSeeder do
  subject(:course_seeder) do
    described_class.create(path, position) do |course|
      course.identifier_uuid = 'course_uuid'
      course.title = 'Foundations'
      course.description = 'a foundation course'
    end
  end

  let(:path) { create(:path, id: 100) }
  let(:position) { 1 }

  describe '.create' do
    it 'creates a new course' do
      expect { course_seeder }.to change { Course.count }.from(0).to(1)
    end

    it 'create a course with the given title' do
      course_seeder

      course = Course.find_by(identifier_uuid: 'course_uuid')
      expect(course.title).to eq('Foundations')
    end

    it 'create a course with the given description' do
      course_seeder

      course = Course.find_by(identifier_uuid: 'course_uuid')
      expect(course.description).to eq('a foundation course')
    end

    it 'create a course with the given position' do
      course_seeder

      course = Course.find_by(identifier_uuid: 'course_uuid')
      expect(course.position).to eq(1)
    end

    context 'when the course already exists' do
      it 'updates the attributes that are different' do
        existing_course = create(:course, identifier_uuid: 'course_uuid', title: 'Development 101', position: 2)

        expect { course_seeder }
          .to change { existing_course.reload.title }.from('Development 101').to('Foundations')
                                                     .and change { existing_course.position }.from(2).to(1)
      end
    end
  end

  describe '#add_section' do
    let(:course) { Course.find_by(identifier_uuid: 'course_uuid') }

    it 'adds a section to the course' do
      course_seeder

      expect do
        course_seeder.add_section do |section|
          section.identifier_uuid = 'section_uuid'
          section.title = 'Basics'
          section.description = 'A Basics section'
        end
      end.to change { course.sections.count }.from(0).to(1)
    end

    context 'when adding multiple sections' do
      it 'applies to correct position to each section' do
        section_one = course_seeder.add_section do |section|
          section.identifier_uuid = 'section_uuid_1'
          section.title = 'Basics'
          section.description = 'A Basics section'
        end

        section_two = course_seeder.add_section do |section|
          section.identifier_uuid = 'section_uuid_2'
          section.title = 'Intermediate'
          section.description = 'A Intermediate section'
        end

        section_three = course_seeder.add_section do |section|
          section.identifier_uuid = 'section_uuid_3'
          section.title = 'Advanced'
          section.description = 'A Advanced section'
        end

        expect(section_one.section.position).to eq(1)
        expect(section_two.section.position).to eq(2)
        expect(section_three.section.position).to eq(3)
      end
    end
  end

  describe '#delete_removed_sections' do
    it 'deletes sections that are in the db but removed from the seeds file' do
      course = create(:course, identifier_uuid: 'course_uuid')
      create(:section, identifier_uuid: 'section_uuid_1', course_id: course.id)
      seeded_section = create(:section, identifier_uuid: 'section_uuid_2', course_id: course.id)

      course_seeder.add_section do |section|
        section.identifier_uuid = 'section_uuid_2'
      end

      course_seeder.delete_removed_seeds
      expect(course_seeder.course.sections.reload).to contain_exactly(seeded_section)
    end

    it 'deletes lessons that are in the db but removed from the seeds file' do
      course = create(:course, identifier_uuid: 'course_uuid')
      section_one = create(:section, identifier_uuid: 'section_uuid_1', course_id: course.id)
      section_two = create(:section, identifier_uuid: 'section_uuid_2', course_id: course.id)

      create(:lesson, section_id: section_one.id, identifier_uuid: 'lesson_uuid_1')
      lesson_two = create(:lesson, section_id: section_two.id, identifier_uuid: 'lesson_uuid_2')
      create(:lesson, section_id: section_one.id, identifier_uuid: 'lesson_uuid_3')

      course_seeder.add_section do |section|
        section.identifier_uuid = 'section_uuid_2'

        section.add_lessons(
          {
            identifier_uuid: 'lesson_uuid_2',
            title: 'A Lesson Title',
            description: 'The lessons description',
            url: '/github/lesson',
          }
        )
      end

      course_seeder.delete_removed_seeds
      expect(course_seeder.course.lessons.reload).to contain_exactly(lesson_two)
    end
  end
end
