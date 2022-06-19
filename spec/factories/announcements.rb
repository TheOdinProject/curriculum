FactoryBot.define do
  factory :announcement do
    message { 'a message for all users' }
    expires_at { 1.day.from_now }
    user { create(:user) }
  end
end
