
if Rails.env.development? || ENV['STAGING']
  users = (1..20).map do |number|
    User.find_or_create_by(email: "test_user_#{number}@email.com") do |user|
      user.username = "test_user_#{number}"
      user.password = "password123"
    end
  end

  users.each do |user|
    ProjectSubmission.find_or_create_by(user_id: user.id, lesson_id: Lesson.find_by(title: 'HTML/CSS').id) do |submission|
      submission.live_preview_url = 'https://www.google.com'
      submission.repo_url = 'https://github.com'
    end
  end
end
