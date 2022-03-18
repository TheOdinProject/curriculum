require './lib/seeds/helpers'
require './lib/seeds/course_seeder'

module Seeds
  class PathSeeder
    include Helpers

    attr_accessor :identifier_uuid, :title, :description, :position, :default_path, :short_title

    def initialize
      @seeded_courses = []

      yield(self)
      @path = path
    end

    def self.create(&block)
      new(&block)
    end

    def path
      @path ||= ::Path.seed(:identifier_uuid) do |path|
        path.identifier_uuid = identifier_uuid
        path.title = title
        path.short_title = short_title
        path.description = description
        path.position = position
        path.default_path = default_path || false
      end.first
    end

    def add_course(&block)
      Seeds::CourseSeeder.create(path, course_position, &block).tap do |seeded_course|
        seeded_courses.push(seeded_course)
      end
    end

    def delete_removed_courses
      destroy_removed_seeds(path.courses, seeded_courses.map(&:course))
    end

    private

    attr_reader :seeded_courses

    def course_position
      seeded_courses.size + 1
    end
  end
end
