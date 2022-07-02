require './lib/seeds/helpers'
require './lib/seeds/course_seeder'

module Seeds
  class PathSeeder
    include Helpers

    attr_accessor :identifier_uuid, :title, :description, :position, :default_path, :short_title, :badge_uri

    def initialize
      @seeded_courses = []

      yield(self)
      @path = path
    end

    def self.create(&)
      new(&)
    end

    def path # rubocop:disable Metrics/AbcSize
      @path ||= ::Path.seed(:identifier_uuid) do |path|
        path.identifier_uuid = identifier_uuid
        path.title = title
        path.short_title = short_title
        path.description = description
        path.position = position
        path.default_path = default_path || false
        path.badge_uri = badge_uri
      end.first
    end

    def add_course(&)
      Seeds::CourseSeeder.create(path, course_position, &).tap do |seeded_course|
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
