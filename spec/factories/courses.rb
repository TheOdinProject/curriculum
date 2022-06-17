FactoryBot.define do
  factory :course do
    path
    sequence(:title) { |n| "test course#{n}" }
    sequence(:position) { |n| n }
    identifier_uuid { SecureRandom.uuid }
    badge_uri { 'badge-foundations.svg' }
  end
end
