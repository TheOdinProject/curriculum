Given(/^I have a omniauth account$/) do
  FactoryGirl.create(
    :user,
    username: 'kevin',
    email: 'kevin@example.com',
    provider: 'github',
    uid: '123545'
  )
end

When(/^I go to the sign in page$/) do
  visit login_path
end

When(/^click the sign in with github button$/) do
  click_link('Sign in with Github')
end

Then(/^I should be logged in$/) do
  expect(page.body).to include('Thanks for logging in with Github!')
  expect(page.body).to include('kevin')
end

Given(/^I have a unconfirmed omniauth account$/) do
  FactoryGirl.create(
    :user,
    username: 'kevin',
    email: 'kevin@example.com',
    provider: 'github',
    uid: '123545',
    created_at: 1.day.ago,
    confirmed_at: nil,
    legal_agreement: true
  )
end

When(/^I sign in$/) do
  visit('/login')
  click_link('Sign in with Github')
end

Then(/^I should see a message reminding me to confirm my email address$/) do
  expect(page).to have_content("Didn't receive confirmation instructions, "\
                     'or need them again?')
end
