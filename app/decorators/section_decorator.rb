class SectionDecorator < ApplicationDecorator
  def lessons
    section.lessons.map { |lesson| LessonDecorator.new(lesson) }
  end

  private

  def section
    __getobj__
  end
end
