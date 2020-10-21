namespace :data_migrations do
  desc 'Migrate Existing Web Dev 101 Users to the Web Development 101 Path'
  task move_web_dev_101_users: :environment do
    user_count = 0
    puts 'Updating Users'
    web_dev_101_lessons = Course.find_by!(title: 'Web Development 101').lesson_ids
    path = Path.find_by!(title: 'Web Development 101')

    ActiveRecord::Base.logger.level = 1
    User.find_in_batches do |group|
      group.each do |user|
        puts user_count += 1
        if user.lesson_completions.count.zero?
          user.update(path_id: path.id)
        elsif (user.lesson_completions.pluck(:lesson_id) - web_dev_101_lessons).empty?
          user.update(path_id: path.id)
        end
      end
    end

    puts 'Finished!'
  end
end
