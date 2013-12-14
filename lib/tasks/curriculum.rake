namespace :curriculum do

  desc "Grab Latest Lesson Content from Github"
  task :update_content => :environment do
    puts "Updating the curriculum..."

    puts "Creating Github link..."
    github = Github::Repos.new :user => "theodinproject", :repo => "curriculum", :oauth_token => "#{ENV['GITHUB_API_TOKEN']}"

    lessons = Lesson.all
    count = lessons.count
    puts "Cycling through #{count} lessons...\n\n\n"
    lessons.each_with_index do |lesson,i|
      # return if i > 5 # for debugging
      puts "Retrieving Lesson #{i+1}/#{count}: #{lesson.title}"
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
        snippet_end = decoded_file.index("\n")-1 || 03
        puts "    Adding content: \"#{decoded_file[0..snippet_end]}\""
        lesson.content = decoded_file
        lesson.save!
        # puts "Added content to the lesson..."
      elsif decoded_file.nil?
        puts "\n\n\n\nThis should never actually display.  Why are some of the lessons coming in nil????????????\n\n\n\n"
      else
        puts "\n\n\n FAILED TO ADD CONTENT TO THE LESSON!!!\n\n\n"
      end
    end

    puts "\n\n\nALL DONE! Updated the curriculum."
  end


end