namespace :lesson_completed do

  desc 'Lessons Completed Today'
  task today: :environment do
    DiscordNotifier.notify(Notifications::DailySummary.new)
  end
end
