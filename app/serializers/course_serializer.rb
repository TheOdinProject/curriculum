class CourseSerializer
  attr_reader :course, :between_dates
  private :course, :between_dates

  def initialize(course, between_dates = nil)
    @course, @between_dates = course, between_dates
  end

  def self.as_json(course, between_dates = nil)
    new(course, between_dates).as_json
  end

  def as_json(options = nil)
    {
      title: course.title,
      sections: serialized_sections,
    }
  end

  private

  def serialized_sections
    course.sections.map do |section|
      SectionSerializer.as_json(section, between_dates)
    end
  end
end
