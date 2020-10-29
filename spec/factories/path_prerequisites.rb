FactoryBot.define do
  factory :path_prerequisite do
    association :path, factory: :path
    association :prerequisite, factory: :path
  end
end
