FactoryBot.define do
  factory :flag do
    flagger { build(:user) }
    project_submission
    reason { "It's offensive" }
  end
end
