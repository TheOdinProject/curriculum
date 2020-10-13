FactoryBot.define do
  factory :path do
    sequence(:title) { |n| "test lesson#{n}" }
    sequence(:position) { |n| n }
    description { 'A Path' }
  end
end
