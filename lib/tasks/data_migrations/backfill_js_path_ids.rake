# rubocop:disable all
namespace :data_migrations do
  desc 'backfill js path ids on lesson_completions'
  task backfill_js_path_ids: :environment do
    puts 'Back Filling JS path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = 2
      WHERE course_id = 41
    )
    puts sql

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
