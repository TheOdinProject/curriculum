Given(/^I have a unconfirmed account that is over (\d+) days old$/) do |arg1|
  @user = FactoryGirl.create(:user, confirmed_at: nil, created_at: 2.days.ago)
  @user.update_attributes(confirmation_sent_at: 2.days.ago)
end

When(/^I try to login$/) do
  log_in(@user)
end

Then(/^a message will be displayed instructing me to confirm my email$/) do
  expect(page).to have_content('You have to confirm your account before continuing.')
end
