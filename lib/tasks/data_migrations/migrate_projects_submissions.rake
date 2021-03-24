# rubocop:disable all
namespace :data_migrations do

  desc "Migrate project submissions to new courses"
  task migrate_project_submissions: :environment do
    project_submissions = ProjectSubmission.joins(:user).where(user: { path_id: [2,4]})

    puts "Migrating #{project_submissions.count} project submissions"

    progressbar = ProgressBar.create total: project_submissions.count, format: "%t: |%w%i| Completed: %c %a %e"
    project_submissions.find_each do |submission|
      begin
        lesson_identifier_uuid = submission.lesson.identifier_uuid
        new_lesson = Lesson.where(identifier_uuid: lesson_identifier_uuid).order(:created_at).last

        submission.update!(lesson_id: new_lesson.id) if new_lesson.id != submission.lesson_id
      rescue StandardError => e
        progressbar.log "Error with submission ##{submission.id}: #{e.message}"
      ensure
        progressbar.increment
      end
    end
  end
end
