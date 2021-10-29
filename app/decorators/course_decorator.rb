class CourseDecorator < ApplicationDecorator
  def sections
    course.sections.map { |section| SectionDecorator.new(section) }
  end

  private

  def course
    __getobj__
  end
end
