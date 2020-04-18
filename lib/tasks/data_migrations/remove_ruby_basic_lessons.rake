namespace :data_migrations do
  desc "Remove Old Ruby Basic Lessons"
  task remove_old_ruby_basic_lessons: :environment do
    Section.find_by_title('Basic Ruby').lessons.each do |lesson|
      lesson.lesson_completions.delete_all
      lesson.destroy
    end

    puts 'done'
  end
end
