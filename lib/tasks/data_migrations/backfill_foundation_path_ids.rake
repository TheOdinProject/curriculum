# rubocop:disable all
namespace :data_migrations do
  desc 'backfill foundations path ids on lesson_completions'
  task backfill_foundation_path_ids: :environment do
    puts 'Back Filling Foundation path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = 4
      WHERE course_id = 30
    )
    puts sql

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
