FactoryBot.define do
  factory :notification do
    recipient factory: :user
    type { '' }
    params { '' }
    read_at { '2021-03-08 21:14:47' }
  end
end
