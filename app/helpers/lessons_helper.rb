module LessonsHelper
  def github_edit_url(lesson)
    github_link("curriculum/edit/main#{lesson.url}")
  end
end
