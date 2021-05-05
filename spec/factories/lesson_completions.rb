FactoryBot.define do
  factory :lesson_completion do
    association :user, factory: :user
    association :lesson, factory: :lesson
  end
end
