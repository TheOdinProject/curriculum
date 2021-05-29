# rubocop:disable all
namespace :data_migrations do

  desc "Create Game Jam Admin Flash"
  task create_game_jam_message: :environment do

    puts "Creating Message"

    AdminFlash.create!(
      message: "The Odin Project is hosting a game jam! <a href='https://itch.io/jam/top-jam-1'>Check it out here</a>. More information in the discord server, which can be found in the community tab, check the #announcements channel and the associated jam channels!",
      expires: 41.days.from_now,
    )
  end
end
