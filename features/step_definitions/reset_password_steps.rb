When /^I request to reset my password$/ do
  visit root_path
  click_link 'Login'
  click_link 'Forgot your password?'

  fill_in 'Email', with: 'kevin@example.com'
  click_button 'Send reset instructions'
end

Then /^I should get an email to reset the password$/ do
  open_email ('kevin@example.com')
  expect(current_email).to have_content('Someone has requested a link to change your password. You can do this through the link below.')
  expect(current_email).to have_link('Change my password')
end

When /^I click on the reset password link$/ do
  current_email.click_link 'Change my password'
end

When /^I fill in the new password$/ do
  fill_in 'user_password', with: 'newpassword'
  fill_in 'user_password_confirmation', with: 'newpassword'
  click_button 'Change my password'
end

When /^I fill in non-matching passwords$/ do
  fill_in 'user_password', with: 'newpassword'
  fill_in 'user_password_confirmation', with: 'password'
  click_button 'Change my password'
end

Then /^my password should be changed$/ do
  expect(page).to have_content('Your password was changed successfully. You are now signed in.')
end

Then /^I should get an error$/ do
  expect(page).to have_content('Please review the problems below')
end