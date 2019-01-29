class LessonSerializer
  attr_reader :lesson, :days
  private :lesson, :days

  def initialize(lesson, days = nil)
    @lesson, @days = lesson, days
  end

  def self.as_json(lesson, days)
    new(lesson, days).as_json
  end

  def as_json(options=nil)
    {
      title: lesson.title,
      completions: completions.count,
    }
  end

  private

  def completions
    if days
      lesson.lesson_completions.where("created_at > ?", DateTime.now - days)
    else
      lesson.lesson_completions
    end
  end
end
