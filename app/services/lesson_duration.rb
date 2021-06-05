class LessonDuration
  def initialize(lesson, lesson_completions)
    @lesson = lesson
    @lesson_completions = lesson_completions
  end

  def duration
    ActiveSupport::Duration.build(average_duration.to_i).inspect
  end

  delegate :title, to: :lesson

  private

  attr_reader :lesson, :lesson_completions

  # rubocop:disable Style/RescueModifier
  def average_duration
    durations.sum / durations.size rescue 0
  end
  # rubocop:enable Style/RescueModifier

  def durations
    lesson_completions
      .where(lesson_id: [lesson.id, previous_lesson.id])
      .group('lesson_completions.student_id')
      .having('count(lesson_completions) = 2')
      .pluck(Arel.sql('max(extract(epoch from created_at)) - min(extract(epoch from created_at))'))
  end

  def previous_lesson
    FindLesson.new(lesson, lesson.course).previous_lesson
  end
end
