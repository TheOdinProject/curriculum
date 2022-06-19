class UpdateLessonContentJob
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: false

  def perform(github_paths)
    lessons = Lesson.where(github_path: github_paths)

    lessons.each(&:import_content_from_github)
  end
end
