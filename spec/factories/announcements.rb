FactoryBot.define do
  factory :announcement do
    message { 'a message for all users' }
    expires { 1.day.from_now }
  end
end
