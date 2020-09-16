class LessonSerializer
  def initialize(lesson, between_dates = nil)
    @lesson = lesson
    @between_dates = between_dates
  end

  def self.as_json(lesson, between_dates = nil)
    new(lesson, between_dates).as_json
  end

  def as_json(_options = nil)
    {
      title: lesson.title,
      completions: completions.count,
    }
  end

  private

  attr_reader :lesson, :between_dates

  def completions
    lesson.lesson_completions.where(created_at: between_dates)
  end
end
