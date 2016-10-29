When(/^I click the cancel my account link$/) do
  visit('users/edit')
  click_link('Cancel my account')
end

Then(/^my account should be deleted$/) do
  expect(User.count).to eql(0)
  expect(page.body).
    to include('Bye! Your account was successfully cancelled')
end
