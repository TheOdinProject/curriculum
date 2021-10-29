module LessonsHelper
  def github_edit_url(lesson)
    github_link("curriculum/edit/main#{lesson.url}")
  end

  def user_submission(current_user, lesson)
    return if current_user.blank?

    project_submission = current_user.project_submissions.viewable.find_by(lesson_id: lesson.id)
    ProjectSubmissionSerializer.as_json(project_submission, current_user) if project_submission.present?
  end
end
