namespace :curriculum do

  desc 'Grab Latest Lesson Content from Github'
  task update_content: :environment do
    Rake::Task['curriculum:content:import'].invoke
    Rake::Task['curriculum:content:verify'].invoke
  end

  namespace :content do
    desc "Import all lessons' content from GitHub"
    task import: :environment do
      total = Lesson.count

      Rails.logger.info 'Importing lesson content...'

      Lesson.all.each_with_index do |lesson, i|
        Rails.logger.info "Importing #{i+1}/#{total}: #{lesson.title}"
        lesson.import_content_from_github
      end

      Rails.logger.info 'Lesson content import complete.'
    end

    desc 'Verify that all lessons have content'
    task verify: :environment do
      Rails.logger.info 'Verifying lesson content...'

      Lesson.all.each_with_index do |lesson, i|
        Rails.logger.error("Nil content for #{lesson.title}!") if lesson.content.nil?
        Rails.logger.error("Blank content for #{lesson.title}!") if lesson.content.blank?
      end

      Rails.logger.info 'Lesson content verified.'
    end
  end
end
