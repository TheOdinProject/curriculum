namespace :curriculum do

  desc "Grab Latest Lesson Content from Github"
  task :update_content => :environment do
    puts "Updating the curriculum..."

    puts "Creating Github link..."
    github = Github::Repos.new :user => "theodinproject", :repo => "curriculum", :oauth_token => "#{ENV['GITHUB_API_TOKEN']}"

    puts "Cycling through lessons...\n\n\n"
    Lesson.all.each do |lesson|
      puts "Lesson: #{lesson.title}"
      # begin
        response = github.contents.get :path => lesson.url
        # Decode the gibberish into a real file and render to html
        decoded_file = Base64.decode64(response["content"])
      # serve all errors as 404: Not Found
      # NOTE: API rate limit errors will still look like 404's now
      # rescue
      #   raise ActionController::RoutingError.new('Not Found')
      # end
      if decoded_file 
        lesson.content = decoded_file
        lesson.save!
        # puts "Added content to the lesson..."
      else
        puts "\n\n\n FAILED TO ADD CONTENT TO THE LESSON!!!\n\n\n"
      end
    end

    puts "ALL DONE! Updated the curriculum."
  end


end