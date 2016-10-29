Given(/^I am a user who already has an account$/) do
  user = FactoryGirl.create(:user)
  log_in user
end

When(/^I click the link your github account button$/) do
  visit('users/1')
  click_link('Link your Github account')
end

Then(/^my Github account should be linked to my account$/) do
  expect(User.last.uid).to eql('123545')
end
