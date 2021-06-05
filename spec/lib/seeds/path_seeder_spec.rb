require './lib/seeds/path_seeder'
require 'rails_helper'

RSpec.describe Seeds::PathSeeder do
  subject(:path_seeder) do
    described_class.create do |path|
      path.identifier_uuid = 'path_uuid'
      path.title = 'Foundations'
      path.description = 'a foundation path'
      path.position = 1
      path.default_path = true
    end
  end

  describe '.create' do
    it 'creates a new path' do
      expect { path_seeder }.to change { Path.count }.from(0).to(1)
    end

    it 'creates a path with the given title' do
      path_seeder

      path = Path.find_by(identifier_uuid: 'path_uuid')
      expect(path.title).to eq('Foundations')
    end

    it 'creates a path with the given description' do
      path_seeder

      path = Path.find_by(identifier_uuid: 'path_uuid')
      expect(path.description).to eq('a foundation path')
    end

    it 'creates a path with the given position' do
      path_seeder

      path = Path.find_by(identifier_uuid: 'path_uuid')
      expect(path.position).to eq(1)
    end

    it 'creates a path with the given default path attribute' do
      path_seeder

      path = Path.find_by(identifier_uuid: 'path_uuid')
      expect(path.default_path).to be(true)
    end

    context 'when the path already exists' do
      it 'updates the attributes that are different' do
        existing_path = create(:path, identifier_uuid: 'path_uuid', title: 'Development 101', position: 2)

        expect { path_seeder }.to change { existing_path.reload.title }
          .from('Development 101').to('Foundations')
          .and change { existing_path.position }.from(2).to(1)
      end
    end
  end

  describe '#add_course' do
    let(:path) { Path.find_by(identifier_uuid: 'path_uuid') }

    it 'adds a course to the path' do
      path_seeder

      expect do
        path_seeder.add_course do |course|
          course.identifier_uuid = 'course_uuid'
          course.title = 'Ruby'
          course.description = 'A Ruby course'
        end
      end.to change { path.courses.count }.from(0).to(1)
    end

    context 'when adding multiple courses' do
      it 'applies to correct position to each course' do
        course_one = path_seeder.add_course do |course|
          course.identifier_uuid = 'course_uuid_1'
          course.title = 'Ruby'
          course.description = 'A Ruby course'
        end

        course_two = path_seeder.add_course do |course|
          course.identifier_uuid = 'course_uuid_2'
          course.title = 'Rails'
          course.description = 'A Rails course'
        end

        course_three = path_seeder.add_course do |course|
          course.identifier_uuid = 'course_uuid_3'
          course.title = 'JS'
          course.description = 'A JS course'
        end

        expect(course_one.course.position).to eq(1)
        expect(course_two.course.position).to eq(2)
        expect(course_three.course.position).to eq(3)
      end
    end
  end

  describe '#delete_removed_courses' do
    it 'deletes courses that are in the db but removed from the seeds file' do
      path = create(:path, identifier_uuid: 'path_uuid')
      create(:course, identifier_uuid: 'course_uuid_1', path_id: path.id)
      seeded_course = create(:course, identifier_uuid: 'course_uuid_2', path_id: path.id)

      path_seeder.add_course do |course|
        course.identifier_uuid = 'course_uuid_2'
      end

      path_seeder.delete_removed_courses
      expect(path_seeder.path.courses.reload).to contain_exactly(seeded_course)
    end
  end
end
