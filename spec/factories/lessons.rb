# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    title "MyString"
    url "MyString"
    position 1
    description "MyText"
    is_project false
    section_id ""
    course_id 1
  end
end
