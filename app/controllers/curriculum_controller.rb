class CurriculumController < ApplicationController

  def index
    # URLs for the github API take the direct path form
    # and not the explicit URL-at-the-browser-bar form...
    # https://api.github.com/repos/theodinproject
    #   /curriculum/contents/dir/contributing.md

    github = Github::Repos.new :user => "theodinproject", :repo => "curriculum"
    # response = github.commits.all 'eriktrautman', 'modernwanderlust'
    # response = github.repos.contents "theodinproject", "curriculum"
    puts "\n\n\n\n DIR is #{params[:dir]}! \n\n\n\n"
    response = github.contents.get :path => "#{params[:dir]}"
    puts "\n\n\n\n\n RESPONSE IS : #{response.inspect} ! \n\n\n\n\n"
    @response = Base64.decode64(response["content"])

    # NEXT STEPS: 
    # Get the response to include newlines or md wont render right
  end

end
