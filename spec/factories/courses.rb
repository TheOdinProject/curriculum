FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "test course#{n}" }
    title_url { title.parameterize }
    sequence(:position) { |n| n }
  end
end
