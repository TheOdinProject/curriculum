Given(/^I am on the sign up page$/) do
  visit('/users/sign_up')
end

Given(/^I click the sign up with Github Button$/) do
  click_link('Sign up with Github')
end

Given(/^I verify my details$/) do
  fill_in('user_username', with: 'Kevin')
  fill_in('user_email', with: 'kevin@email.com')
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

Given(/^I am on the homepage$/) do
  visit root_url
end

When(/^I visit the signup page$/) do
  click_link 'Login'
  click_link 'Sign up'
end

When(/^I sign up with the email '([^']+)'$/) do |email|
  step 'I visit the signup page'
  fill_in 'user_username', with: 'random'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: 'password'
  fill_in 'user_password_confirmation', with: 'password'
  check 'user_legal_agreement'
  click_button 'Sign up'
end

When(/^I follow '([^']+)' in the email$/) do |link|
  current_email.click_link link
end

When(/^I try to sign up without an email$/) do
  step 'I visit the signup page'
  click_button 'Sign up'
end

Then(/'([^']+)' receives an email with subject '([^']+)'/) do |address, subject|
  open_email(address)
  expect(current_email.subject).to eq(subject)
end

Then(/^I should see '([^']+)' in the email body$/) do |content|
  expect(current_email.body).to include(content)
end

Then(/^I should not able to sign up$/) do
  expect(page).to have_content('Please review the problems below')
end

Then(/^I should see '([^']+)'$/) do |content|
  expect(page).to have_content(content)
end
