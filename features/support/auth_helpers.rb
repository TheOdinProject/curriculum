module AuthHelpers

  def log_in user
    visit root_path
    visit '/login'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
    expect(page).to have_content(user.username)
  end

end

World AuthHelpers # include authentication helpers in the World instance
