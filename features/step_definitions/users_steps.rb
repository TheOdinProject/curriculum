Given(/^I am on the sign up page$/) do
  visit('/users/sign_up')
end

Given(/^I click the sign up with Github Button$/) do
  click_link('Sign up with Github')
end

Given(/^I verify my details$/) do
  fill_in('user_username', :with => "Kevin")
  fill_in('user_email', :with => "kevin@email.com")
  check('user[legal_agreement]')
end

When(/^I click the sign up button$/) do
  click_button('Sign up')
end

Then(/^my account should be created$/) do
  expect(User.last.email).to eql('kevin@email.com')
end

Then(/^I should be sent a confirmation email$/) do
  email = ActionMailer::Base.deliveries.last

  expect(email.to).to eql(['kevin@email.com'])
  expect(email.subject).to eql('Getting started with The Odin Project')
  expect(email.encoded).to include('Confirm your email')
end

Then(/^I should be redirected to the courses page$/) do
  expect(page.current_path).to eql('/courses')
end
