When(/^I go to the edit profile page of another user$/) do
  user = FactoryGirl.create(:user)
  visit("users/#{user.id}/edit")
end

Then(/^I will be denied access$/) do
  expect(page).to have_content('You are not authorized to do that')
end

When(/^I edit my profile$/) do
  visit("users/#{@user.id}")
  click_link('Edit Profile')

  fill_in('user_about', with: 'This my profile')
  fill_in('user_skype', with: 'skype username')
  fill_in('user_screenhero', with: 'screenhero username')
  fill_in('user_google_plus', with: 'gplus username')
  fill_in('user_github', with: 'github username')
  fill_in('user_twitter', with: 'twitter username')
  fill_in('user_facebook', with: 'facebook username')
  fill_in('user_linkedin', with: 'linkedin username')

  click_button('Update')
end

Then(/^my profile will be updated$/) do
  expect(page).to have_content('This my profile')
  expect(page).to have_content('Skype: skype username')
  expect(page).to have_content('ScreenHero: screenhero username')
  expect(page).to have_css('.fa.fa-google-plus')
  expect(page).to have_css('.fa.fa-github')
  expect(page).to have_css('.fa.fa-twitter')
  expect(page).to have_css('.fa.fa-facebook-square')
  expect(page).to have_css('.fa.fa-linkedin')
end
