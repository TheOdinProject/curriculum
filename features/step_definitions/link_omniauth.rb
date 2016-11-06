Given(/^I am a user who already has an account$/) do
  user = FactoryGirl.create(:user, confirmed_at: 2.days.ago)
  log_in(user)
  expect(page).to have_content(user.username)
end

When(/^I click the link your github account button$/) do
  visit("users/#{User.last.id}")
  click_link('Link your Github account')
end

Then(/^my Github account should be linked to my account$/) do
  expect(User.last.uid).to eql('123545')
end
