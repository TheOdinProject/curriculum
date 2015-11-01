FactoryGirl.define do
 
  factory :user, :aliases => [:creator] do
    before(:create) do |user|
      user.stub(:send_welcome_email)
    end
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foo#{n}@bar.com"
    end

    password "foobar"
    legal_agreement true 
    confirmed_at Time.now - 5000000 #Approximately 1 month ago
    reg_before_conf false
    # For testing ordering of most recently visited student.
    # Without this, users were created with nothing in this field, with the side effect
    # that User.order("last_sign_in_at desc") was putting those users as before any others.
    sequence :last_sign_in_at do |n|
      n.weeks.ago
    end
    
  end
 
  factory :content_bucket do
    sequence :name do |n| 
      "foobarContent#{n}"
    end
  end
 
  factory :lesson do
    sequence :title do |n|
      "test lesson#{n}"
    end
    sequence :position do |n| 
      n
    end
    url "http://www.bogus.com/subpage/whatever.git" # need url to be non-nil for lesson contribution links feature
    title_url { title.parameterize }
    association :section
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
    is_active true
    title_url { title.parameterize }
    sequence :position do |n| 
      n
    end
  end
  
  factory :admin_flash do
    message "Some Message"
    expires 2.days.from_now
  end
 
  factory :expired_admin_flash, :parent => :admin_flash do
    expires "#{1.day.ago}"
    message "Some Expired Message"
  end

  factory :ad do
    client "some client"
    style "banner"
    url "http://fake.com"
    image_path "/some_image.png"
    category "ad category"
  end
 
 
end