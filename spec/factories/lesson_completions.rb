FactoryBot.define do
  factory :lesson_completion do
    association :student, factory: :user
  end
end
