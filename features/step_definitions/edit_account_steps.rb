Given(/^I am logged in with a omniauth account$/) do
  @user = FactoryGirl.create(
            :user,
            username: 'kevin',
            email: 'kevin@example.com',
            provider: 'github',
            uid: '123545',
          )
  log_in(@user)
end

When(/^I edit my account$/) do
  visit('/users/edit')
  fill_in('user_username', with: 'Kevin Foobar')
  click_button('Update')
end

Then(/^my updated details should be saved$/) do
  @user.reload
  expect(@user.username).to eql('Kevin Foobar')
  expect(page).to have_content('You updated your account successfully')

end
