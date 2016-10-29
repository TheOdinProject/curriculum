When(/^I click the sign out link$/) do
  click_link('Logout')
end

Then(/^I should be signed out$/) do
  expect(page.body).to include('Login')
end
