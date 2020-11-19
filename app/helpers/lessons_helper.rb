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

  def legacy_submissions_url(lesson)
    github_link("curriculum/blob/master/legacy_submissions#{lesson.url}")
  end

  def user_submission(current_user)
    project_submission = ProjectSubmission.find_by(user_id: current_user&.id)

    ProjectSubmissionSerializer.as_json(project_submission, current_user) if project_submission.present?
  end
end
