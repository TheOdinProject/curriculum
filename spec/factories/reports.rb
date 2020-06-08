FactoryBot.define do
  factory :report do
    reporter { build(:user) }
    project
    reason { "It's offensive" }
  end
end
