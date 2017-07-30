require 'delegate'

class LessonDecorator < SimpleDelegator

  def github_url
    'https://github.com/TheOdinProject/curriculum/tree/master' + url
  end
end
