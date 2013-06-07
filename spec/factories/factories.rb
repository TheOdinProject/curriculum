FactoryGirl.define do

  factory :user do
    username "foobar"
    email "foo@bar.com"
    password "foobar"
  end

  factory :cal_event do
    summary "Title"
    start "#{DateTime.now()}"
    self.end "#{DateTime.now()+3600}"
    user
  end

end