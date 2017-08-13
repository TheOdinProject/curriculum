class LessonDecorator < ApplicationDecorator

  def title
    if is_project?
      "Project: #{__getobj__.title}"
    else
      __getobj__.title
    end
  end

  def github_url
    'https://github.com/TheOdinProject/curriculum/tree/master' + url
  end
end
