FactoryBot.define do
  factory :section do
    course
    sequence(:title) { |n| "test section#{n}" }
    sequence(:position) { |n| n }
    identifier_uuid { SecureRandom.uuid }
  end
end
