module Seeds
  class LessonSeeder
    def initialize(section, position, attributes)
      @section = section
      @position = position
      @attributes = attributes
    end

    def self.create(section, position, attributes)
      new(section, position, attributes).lesson
    end

    # rubocop: disable Metrics/AbcSize, Metrics/MethodLength
    def lesson
      Lesson.seed(:identifier_uuid, :course_id) do |lesson|
        lesson.identifier_uuid = attributes.fetch(:identifier_uuid)
        lesson.title = attributes.fetch(:title)
        lesson.description = attributes.fetch(:description)
        lesson.url = attributes.fetch(:url)
        lesson.section_id = section.id
        lesson.is_project = attributes.fetch(:is_project, false)
        lesson.accepts_submission = attributes.fetch(:accepts_submission, false)
        lesson.has_live_preview = attributes.fetch(:has_live_preview, false)
        lesson.position = position
        lesson.course_id = section.course_id
        lesson.choose_path_lesson = attributes.fetch(:choose_path_lesson, false)
      end
    end
    # rubocop: enable Metrics/AbcSize, Metrics/MethodLength

    private

    attr_reader :section, :position, :attributes
  end
end
