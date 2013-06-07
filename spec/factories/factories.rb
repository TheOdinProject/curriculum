FactoryGirl.define do

  factory :user, :aliases => [:creator] do
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password "foobar"
  end

  factory :cal_event do
    summary "Title"
    start "#{DateTime.now()}"
    self.end "#{DateTime.now()+3600}"
    association :creator
  end

  factory :invalid_cal_event, :parent => :cal_event do
    summary ""
  end

  factory :content_bucket do
    sequence :name do |n| 
      "foobarContent#{n}"
    end
  end

end