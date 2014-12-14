def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  # Erik Note: I'm not sure this is actually doing anything at all....
  request.env["devise.mapping"] = Devise.mappings[:user]
  @env = { "omniauth.auth" => { "provider" => "github", "uid" => "1234","legal_agreement" => true, "extra" => { "user_hash" => { "email" => "ghost@nobody.com", "username" => "GhostMan" } } } }
  request.env["omniauth.auth"] = @env["omniauth.auth"]
end

def click_signin_with_github
  visit login_path
  click_link "Sign in with Github"
end

def sign_up_with_github
  visit login_path
  click_link "Sign in with Github"
  fill_in('user_username', :with => "GhostMan")
  fill_in('user_email', :with => "ghost@nobody.com")
  check('user_legal_agreement')
  click_button('Sign up')
end

def attempt_sign_in_no_legal_agreement
  visit login_path
  click_link "Sign in with Github"
  fill_in('user_username', :with => "GhostMan")
  fill_in('user_email', :with => "ghost@nobody.com")
  click_button('Sign up')
end