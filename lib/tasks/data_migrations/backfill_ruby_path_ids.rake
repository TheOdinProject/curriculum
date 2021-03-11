# rubocop:disable all
namespace :data_migrations do
  desc 'backfill ruby path ids on lesson_completions'
  task backfill_ruby_path_ids: :environment do
    puts 'Back Filling Ruby path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = 1
      WHERE course_id = 31
      OR course_id = 32
      OR course_id = 40;
    )
    puts sql

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
