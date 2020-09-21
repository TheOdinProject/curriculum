class ProjectSubmissionFeature
  def self.enabled?(lesson)
    lesson.description == 'Tic Tac Toe'
  end
end
