FactoryBot.define do
  factory :report do
    reporter { build(:user) }
    project_submission
    reason { "It's offensive" }
  end
end
