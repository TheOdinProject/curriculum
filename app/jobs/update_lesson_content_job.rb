class UpdateLessonContentJob
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: false

  def perform(github_urls)
    lessons = Lesson.where(url: github_urls)

    lessons.each(&:import_content_from_github)
  end
end
