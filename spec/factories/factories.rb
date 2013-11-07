FactoryGirl.define do

  factory :user, :aliases => [:creator] do
    # puts "\n\n\n\nAAAAAAHHHHH\n\n\n"
    before(:create) do 
      FactoryGirl.create :lesson
    end
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password "foobar"
    # puts "\n\n CREATED USER!"
    # puts "Lessons are: #{Lesson.all.inspect}!"
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

  factory :lesson do
    sequence :title do |n|
      "test_lesson#{n}"
    end
    sequence :position do |n| 
      n
    end
    association :section
  end

  factory :section do
    sequence :title do |n|
      "test_section#{n}"
    end
    sequence :position do |n| 
      n
    end
    association :course
  end

  factory :course do
    sequence :title do |n|
      "test_course#{n}"
    end
    sequence :position do |n| 
      n
    end
  end

end