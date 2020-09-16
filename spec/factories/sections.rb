FactoryBot.define do
  factory :section do
    course
    sequence(:title) { |n| "test section#{n}" }
    title_url { title.parameterize }
    sequence(:position) { |n| n }
  end
end
