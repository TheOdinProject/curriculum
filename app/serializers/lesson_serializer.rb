class LessonSerializer
  attr_reader :lesson, :between_dates
  private :lesson, :between_dates

  def initialize(lesson, between_dates = nil)
    @lesson, @between_dates = lesson, between_dates
  end

  def self.as_json(lesson, between_dates = nil)
    new(lesson, between_dates).as_json
  end

  def as_json(options=nil)
    {
      title: lesson.title,
      completions: completions.count,
    }
  end

  private

  def completions
    lesson.lesson_completions.where(created_at: between_dates)
  end
end
