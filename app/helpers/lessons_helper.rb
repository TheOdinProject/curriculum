module LessonsHelper
  # Each lesson in the curric has a corresponding file in the github repo,
  # This builds an url to that repo page.   Used by app/views/lessons/_contribution_links.html.erb
  def lesson_on_github(lesson_url)  
    base = "https://github.com/TheOdinProject/curriculum/tree/master/";
    split_url = lesson_url.split('/')      # not the most elegant way... but it works
    return ( base + split_url[-2] + '/' + split_url[-1] )
  end   

  #  This converts a lesson title into url format by changing spaces to '+'
  #  so that title can be submitted as part of query string in a url
  def url_format(title)
    title.gsub(' ', '+')
  end

  def slack_link(course)
    SlackLinkFactory.new(course).build
  end
end
