# Helper method to DRY up user signup for testing
def sign_up_user
  visit signup_path
  fill_in :user_username, :with => "User"
  fill_in :user_email, :with => "user@example.com"
  fill_in :user_password, :with => "password"
  fill_in :user_password_confirmation, :with => "password"
  check :user_legal_agreement
  click_button "Sign up"
end

def sign_in(user)
  visit login_path
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Sign in"
end

def sign_out(user)
  visit logout_path
end
