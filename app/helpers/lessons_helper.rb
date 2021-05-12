module LessonsHelper
  def next_lesson_button_state(lesson)
    if current_user&.completed?(lesson)
      'button--primary'
    else
      'button--secondary'
    end
  end

  def github_edit_url(lesson)
    github_link("curriculum/edit/master#{lesson.url}")
  end

  def user_submission(current_user, lesson)
    return if current_user.blank?

    project_submission = current_user.project_submissions.find_by(lesson_id: lesson.id, discarded_at: nil)
    ProjectSubmissionSerializer.as_json(project_submission, current_user) if project_submission.present?
  end
end
