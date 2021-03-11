# rubocop:disable all
namespace :data_migrations do
  desc 'backfill shared courses path ids on lesson_completions'
  task backfill_shared_courses_path_ids: :environment do
    puts 'Back Filling Getting hired path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = users.path_id
      FROM users
      WHERE lesson_completions.course_id = 38
      AND lesson_completions.student_id = users.id
      AND lesson_completions.path_id IS NULL;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    sql = %(
      UPDATE lesson_completions
      SET path_id = 2
      WHERE course_id = 38
      AND path_id = 4;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Back Filling JS course path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = users.path_id
      FROM users
      WHERE lesson_completions.course_id = 39
      AND lesson_completions.student_id = users.id
      AND lesson_completions.path_id IS NULL;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    sql = %(
      UPDATE lesson_completions
      SET path_id = 2
      WHERE course_id = 39
      AND path_id = 4;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Back Filling HTML course path ids'

    sql = %(
      UPDATE lesson_completions
      SET path_id = users.path_id
      FROM users
      WHERE lesson_completions.course_id = 36
      AND lesson_completions.student_id = users.id
      AND lesson_completions.path_id IS NULL;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    sql = %(
      UPDATE lesson_completions
      SET path_id = 2
      WHERE course_id = 36
      AND path_id = 4;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
