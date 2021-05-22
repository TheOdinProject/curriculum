FactoryBot.define do
  factory :lesson do
    section
    sequence(:title) { |n| "test lesson#{n}" }
    sequence(:position) { |n| n }
    url { '/lesson_course/lesson_title.md' }
    content { 'content' }
    identifier_uuid { SecureRandom.uuid }

    trait :project do
      is_project { true }
      accepts_submission { true }
      has_live_preview { true }
    end
  end
end
