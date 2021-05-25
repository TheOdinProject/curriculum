FactoryBot.define do
  factory :notification do
    association :recipient, factory: :user
    type { '' }
    params { '' }
    read_at { Time.zone.now }
    url { '' }
    message { '' }
  end
end
