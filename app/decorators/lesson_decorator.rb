require 'delegate'

class LessonDecorator < SimpleDelegator

  def github_url
    'https://github.com/TheOdinProject/curriculum/tree/master' + url
  end

  def title_url_format
    title.gsub(' ', '+')
  end
end
