FactoryBot.define do
  factory :user, aliases: [:creator] do
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foo#{n}@bar.com"
    end

    password 'foobar'
    confirmed_at Time.now - 5_000_000
    avatar 'http://github.com/fake-avatar'

    factory :admin do
      admin true
    end
  end

  factory :lesson do
    sequence :title do |n|
      "test lesson#{n}"
    end
    sequence :position do |n|
      n
    end
    url 'http://www.bogus.com/subpage/whatever.git'
    association :section
    content 'content'
  end

  factory :section do
    sequence :title do |n|
      "test section#{n}"
    end
    title_url { title.parameterize }
    sequence :position do |n|
      n
    end
    association :course
  end

  factory :course do
    sequence :title do |n|
      "test course#{n}"
    end
    title_url { title.parameterize }
    sequence :position do |n|
      n
    end
  end

  factory :project do
    repo_url 'https://github.com/user/repo'
    live_preview 'http://mysite.com'
    user
  end
end
