def method_name

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
