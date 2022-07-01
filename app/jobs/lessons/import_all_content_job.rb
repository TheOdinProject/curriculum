module Lessons
  class ImportAllContentJob
    include Sidekiq::Worker
    sidekiq_options retry: 1, dead: false

    def perform
      LessonContentImporter.import_all
    end
  end
end
