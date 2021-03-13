FactoryBot.define do
  factory :course do
    path
    sequence(:title) { |n| "test course#{n}" }
    sequence(:position) { |n| n }
    identifier_uuid { SecureRandom.uuid }
  end
end
