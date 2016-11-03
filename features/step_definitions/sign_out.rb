When(/^I click the sign out link$/) do
  click_link('Logout')
end

Then(/^I should be signed out$/) do
  expect(page).to have_link('Login')
end

Then(/^I should be redirected to the home page$/) do
  expect(page).to have_current_path(home_path(ref: 'logout'))
end
