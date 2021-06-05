FactoryBot.define do
  factory :admin_flash do
    message { 'a message for all users' }
    expires { 1.day.from_now }
  end
end
