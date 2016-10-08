module LessonsHelper

  def lesson_on_github(lesson_url)
    'https://github.com/TheOdinProject/curriculum/tree/master' + lesson_url
  end

  def url_format(title)
    title.gsub(' ', '+')
  end
end
