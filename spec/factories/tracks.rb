FactoryBot.define do
  factory :track do
    sequence(:title) { |n| "test lesson#{n}" }
    sequence(:position) { |n| n }
    description { "A Track"}
  end
end
