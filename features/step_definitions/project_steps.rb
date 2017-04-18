Given(/^the following project submissions exist:$/) do |table|
  hashes = table.hashes
  hashes.each do |hash|
    username = hash.delete('username')
    lesson_title = hash.delete('lesson')
    lesson = Lesson.find_by(title: lesson_title)
    hash.symbolize_keys! # double splat only works on symbol keys
    user = User.find_by(username: username)
    project = FactoryGirl.create(:project, **hash, user: user, lesson: lesson)
  end
end

When(/^I fill in the project submission form with valid values$/) do
  fill_project_form_with(
    'https://github.com/test/testing',
    'https://codepen.io/test'
  )
end

When(/^I fill in the project submission form with invalid values$/) do
  fill_project_form_with('', '')
end

When(/^I click on the edit project submission button$/) do
  click_button 'project-edit-btn'
end

When(/^I click on the delete project submission button$/) do
  click_button 'project-delete-btn'
end

Then(/^I should see the repo url pointing to '([^']+)'$/) do |url|
  expect(find('.repo-url-btn')[:href]).to eq(url)
end

Then(/^I should see the live preview url pointing to '([^']+)'$/) do |url|
  expect(find('.live-preview-btn')[:href]).to eq(url)
end

When(/^I fill in the repo url with '([^']+)'$/) do |url|
  fill_in 'Repository URL', with: url
end

When(/^I fill in the live preview url with '([^']+)'$/) do |url|
  fill_in 'Live Preview', with: url
end

Then(/^I should not see the Add your solution button$/) do
  expect(page).to_not have_selector('#add-submission-button')
end

Then(/^I should( not)? see the edit project submission button$/) do |not_to_see|
  if not_to_see
    expect(page).to_not have_selector('#project-edit-btn')
  else
    expect(page).to have_selector('#project-edit-btn')
  end
end

Then(/^I should( not)? see the delete project submission button$/) do |not_to_see|
  if not_to_see
    expect(page).to_not have_selector('#project-delete-btn')
  else
    expect(page).to have_selector('#project-delete-btn')
  end
end

Then(/^I should see the edit and delete project submission buttons$/) do
  step 'I should see the edit project submission button'
  step 'I should see the delete project submission button'
end

Then(/^I should not see the edit and delete project submission buttons$/) do
  step 'I should not see the edit project submission button'
  step 'I should not see the delete project submission button'
end
