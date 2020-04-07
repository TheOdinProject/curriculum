FactoryBot.define do
  factory :lesson do
    section
    course
    sequence(:title) { |n| "test lesson#{n}" }
    sequence(:position) { |n| n }
    url { 'http://www.bogus.com/subpage/whatever.git' }
    content { 'content' }
  end
end
