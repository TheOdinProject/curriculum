When(/^I go to the edit profile page of another user$/) do
  user = FactoryGirl.create(:user)
  visit("users/#{user.id}/edit")
end

Then(/^I will be denied access$/) do
  expect(page).to have_content('You are not authorized to do that')
end
