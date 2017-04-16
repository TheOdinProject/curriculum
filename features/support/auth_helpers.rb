module AuthHelpers
  def log_in(email, password)
    visit root_path
    click_link 'Login'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end

World AuthHelpers # include authentication helpers in the World instance
