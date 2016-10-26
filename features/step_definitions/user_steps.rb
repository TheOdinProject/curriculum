Given(/^I am on the homepage$/) do
 visit root_url
end

When /^I visit the signup page$/ do
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

When /^I follow '([^']+)' in the email$/ do |link|
  current_email.click_link link
end

When /^I try to sign up without an email$/ do
  step 'I visit the signup page'
  click_button 'Sign up'
end

Then /^'([^']+)' receives an email with '([^']+)' as the subject/ do |address, subject|
  open_email(address)
  expect(current_email.subject).to eq(subject)
end

Then /^I should see '([^']+)' in the email body$/ do |content|
  expect(current_email.body).to include(content)
end

Then /^I should not able to sign up$/ do
  expect(page).to have_content('Please review the problems below')
end

Then /^I should see '([^']+)'$/ do |content|
  expect(page).to have_content(content)
end
