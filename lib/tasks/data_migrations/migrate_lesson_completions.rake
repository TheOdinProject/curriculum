# rubocop: disable all
namespace :data_migrations do
  desc 'Migrate lesson completions to new courses'
  task migrate_lesson_completions: :environment do
    puts 'Migrating JS Course'

    sql = %(
      update lesson_completions
      set course_id = 42
      where path_id = 2 and course_id = 39;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Migrating HTML and CSS Course'

    sql = %(
      update lesson_completions
      set course_id = 43
      where path_id = 2 and course_id = 36;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Migrating Getting Hired Course'

    sql = %(
      update lesson_completions
      set course_id = 44
      where path_id = 2 and course_id = 38;
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Migrating JS Course lessons'

    sql = %(
      Update lesson_completions
      set lesson_id = lessons.id
      from lessons
      where lessons.identifier_uuid = lesson_completions.lesson_identifier_uuid
      and  lesson_completions.course_id = 42 AND lessons.created_at > TIMESTAMP 'yesterday'
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Migrating HTML and CSS Course lessons'

    sql = %(
      Update lesson_completions
      set lesson_id = lessons.id
      from lessons
      where lessons.identifier_uuid = lesson_completions.lesson_identifier_uuid
      and  lesson_completions.course_id = 43 AND lessons.created_at > TIMESTAMP 'yesterday'
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    sql = %(
      Update lesson_completions
      set lesson_id = lessons.id
      from lessons
      where lessons.identifier_uuid = lesson_completions.lesson_identifier_uuid
      and  lesson_completions.course_id = 44 AND lessons.created_at > TIMESTAMP 'yesterday'
    )
    puts sql
    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
