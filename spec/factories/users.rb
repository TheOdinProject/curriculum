FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "foobar#{n}" }
    sequence(:email) { |n| "foo#{n}@bar.com" }
    password { 'foobar' }
    confirmed_at { Time.now - 5_000_000 }
    avatar { 'http://github.com/fake-avatar' }
    admin { false }
    track
  end
end
