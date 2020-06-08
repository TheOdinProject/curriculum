FactoryBot.define do
  factory :project do
    lesson
    repo_url { 'https://github.com/user/repo' }
    live_preview_url { 'http://mysite.com' }
    user
  end
end
