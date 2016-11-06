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

Given(/^I have an account$/) do
  FactoryGirl.create(:user, email: 'kevin@example.com', confirmed_at: nil)
end

When(/^I request for confirmation instructions to be resent$/) do
  visit('/users/confirmation/new')
  fill_in 'Email', with: "kevin@example.com"
  click_button('Resend confirmation instructions')
end

Then(/^I should be resent a confirmation email$/) do
  expect(page).to have_content('You will receive an email with instructions about how to confirm your account in a few minutes')

  open_email('kevin@example.com')
  expect(current_email).to have_content 'Confirm your email'
end
