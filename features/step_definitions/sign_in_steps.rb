Given(/^I have a ominauth account$/) do
  FactoryGirl.create(
    :user,
    username: 'kevin',
    email: 'kevin@example.com',
    provider: 'github',
    uid: '123545'
  )
end

When(/^I go to the sign in page$/) do
  visit('/login')
end

When(/^click the sign in with github button$/) do
  click_link('Sign in with Github')
end

Then(/^I should be logged in$/) do
  expect(page.body).to include('Thanks for logging in with Github!')
  expect(page.body).to include('kevin')
end
