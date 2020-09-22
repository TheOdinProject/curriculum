FactoryBot.define do
  factory :lesson_completion do
    association :student, factory: :user
    association :lesson, factory: :lesson
  end
end
