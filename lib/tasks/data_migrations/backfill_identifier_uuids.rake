# rubocop:disable all
namespace :data_migrations do
  desc 'backfill lesson_identifier_uuids on lesson_completions'
  task backfill_identifier_uuids: :environment do
    puts 'Back Filling lesson identifier uuids'

    sql = %(
      UPDATE lesson_completions
      SET lesson_identifier_uuid = lessons.identifier_uuid
      FROM lessons
      WHERE lesson_completions.lesson_id = lessons.id
    )
    puts sql

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
