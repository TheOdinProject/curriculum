class CourseSerializer
  attr_reader :course, :days
  private :course, :days

  def initialize(course, days = nil)
    @course = course
    @days = days
  end

  def self.as_json(course, days = nil)
    new(course, days).as_json
  end

  def as_json(options = nil)
    {
      title: course.title,
      sections: serialized_sections,
    }
  end

  private

  def serialized_sections
    course.sections.map { |section| SectionSerializer.as_json(section, days) }
  end
end
