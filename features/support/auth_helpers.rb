module AuthHelpers

  def log_in user
    visit root_path
    visit '/login'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'
  end

end

World AuthHelpers # include authentication helpers in the World instance
