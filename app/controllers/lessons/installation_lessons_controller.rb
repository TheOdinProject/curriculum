module Lessons
  class InstallationLessonsController < ApplicationController
    def index
      @lessons = Lesson.installation_lessons
    end
  end
end
