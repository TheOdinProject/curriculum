FactoryBot.define do
  factory :project_submission do
    lesson
    repo_url { 'https://github.com/user/repo' }
    live_preview_url { 'http://mysite.com' }
    user
    discard_at { nil }
  end
end
