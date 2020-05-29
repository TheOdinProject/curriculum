namespace :lessons do
  desc 'Prints Average Lesson Durations'
  task :average_duration, [:start_date, :end_date] => :environment do |task, args|
    start_date = DateTime.parse(args.start_date)
    end_date = DateTime.parse(args.end_date)

    ActiveRecord::Base.logger.level = 1
    Course.all.map do |course|
      lesson_completions = LessonCompletion.where(lesson_id: course.lessons.ids).where('created_at >= ?', start_date).where('created_at <= ?', end_date)

      Rails.logger.info("#{course.title}:")
      course.lessons.map do |lesson|
        lesson_duration = LessonDuration.new(lesson, lesson_completions)

        Rails.logger.info("#{lesson_duration.title}:".indent(2))
        Rails.logger.info("duration: #{lesson_duration.duration}".indent(4))
      end
      Rails.logger.info("----")
    end
    ActiveRecord::Base.logger.level = 0
  end
end