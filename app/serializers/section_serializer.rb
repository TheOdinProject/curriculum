class SectionSerializer
  attr_reader :section, :days
  private :section, :days

  def initialize(section, days = nil)
    @section, @days = section, days
  end

  def self.as_json(section, days)
    new(section, days).as_json
  end

  def as_json(options=nil)
    {
      title: section.title,
      lessons: serialized_lessons
    }
  end

  private

  def serialized_lessons
    section.lessons.map { |lesson| LessonSerializer.as_json(lesson, days) }
  end
end
