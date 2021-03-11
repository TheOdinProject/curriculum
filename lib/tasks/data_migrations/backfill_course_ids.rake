# rubocop:disable all
namespace :data_migrations do
  desc 'backfill course ids on lesson_completions'
  task backfill_course_ids: :environment do
    puts 'Back Filling course ids'

    sql = %(
      UPDATE lesson_completions
      SET course_id = courses.id
      FROM lessons
      JOIN sections ON lessons.section_id = sections.id
      JOIN courses ON sections.course_id = courses.id
      WHERE lesson_completions.lesson_id = lessons.id
      AND lesson_completions.course_id IS NULL;
    )
    puts sql

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
