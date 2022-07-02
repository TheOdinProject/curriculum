FactoryBot.define do
  factory :path do
    sequence(:title) { |n| "test path#{n}" }
    sequence(:position) { |n| n }
    description { 'A Path' }
    identifier_uuid { SecureRandom.uuid }
    badge_uri { 'badge-foundations.svg' }
  end
end
