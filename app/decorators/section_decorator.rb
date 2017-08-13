class SectionDecorator < ApplicationDecorator
  def lessons
    __getobj__.lessons.map { |lesson| LessonDecorator.new(lesson) }
  end
end
