namespace :data_migrations do
  desc 'Remove the Frontend Only Path'
  task remove_frontend_only_path: :environment do
    puts 'Migrating Frontend Only path users to Fullstack JS path'

    sql = %(
     UPDATE users
     SET path_id = '2'
     WHERE path_id = '3'
    )
    puts sql

    puts 'Removing front end only path'
    Path.find_by(title: 'Front End Only').destroy

    ActiveRecord::Base.connection.execute(sql)

    puts 'Done'
  end
end
