require './lib/seeds/helpers'
require './lib/seeds/section_seeder'

module Seeds
  class CourseSeeder
    include Seeds::Helpers

    attr_accessor :identifier_uuid, :title, :description, :position, :show_on_homepage, :badge_uri

    def initialize(path, position)
      @path = path
      @position = position
      @seeded_sections = []

      yield self
      @course = course
    end

    def self.create(path, position, &)
      new(path, position, &)
    end

    def add_section(&)
      Seeds::SectionSeeder.create(course, section_position, &).tap do |section|
        seeded_sections.push(section)
      end
    end

    # rubocop:disable Metrics/AbcSize
    def course
      @course ||= ::Course.seed(:identifier_uuid) do |course|
        course.identifier_uuid = identifier_uuid
        course.title = title
        course.description = description
        course.position = position
        course.path_id = path.id
        course.show_on_homepage = show_on_homepage || false
        course.badge_uri = badge_uri
      end.first
    end
    # rubocop:enable Metrics/AbcSize

    def delete_removed_seeds
      destroy_removed_seeds(course.lessons, seeded_lessons)
      destroy_removed_seeds(course.sections, seeded_sections.map(&:section))
    end

    private

    attr_reader :seeded_sections, :path

    def section_position
      seeded_sections.size + 1
    end

    def seeded_lessons
      seeded_sections.map(&:seeded_lessons).flatten
    end
  end
end
