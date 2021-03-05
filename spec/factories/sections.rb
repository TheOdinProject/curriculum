FactoryBot.define do
  factory :section do
    course
    sequence(:title) { |n| "test section#{n}" }
    sequence(:position) { |n| n }
  end
end
