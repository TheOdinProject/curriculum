module Lessons
  class InstallationLessonsController < ApplicationController
    def index
      @lessons = Lesson.installation_lessons.sort_by do |lesson|
        [lesson.course.position, lesson.path.position]
      end
    end
  end
end
