require 'spec_helper'

def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  env = { "omniauth.auth" => { "provider" => "github", "uid" => "123455","legal_agreement" => true, "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
  request.env["omniauth.auth"] = env["omniauth.auth"]
end

def click_signin
  visit root_path
  click_link "Signin with Github"
end

def fill_in_correctly
  visit root_path
  click_link "Signin with Github"
  fill_in('user_username', :with => "GhostMan")
  fill_in('user_email', :with => "ghost@nobody.com")
  check('user_legal_agreement')
  click_button('Sign up')
end

def dont_check_legal_agreement
  visit root_path
  click_link "Signin with Github"
  fill_in('user_username', :with => "GhostMan")
  fill_in('user_email', :with => "ghost@nobody.com")
  click_button('Sign up')
end

describe OmniauthCallbacksController, "github callback" do

  context 'click Signin with Github' do
    context 'When Github authentication fails' do
      it 'should render a failure message' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :failure
        expect(flash[:alert]).to eq 'Authentication failed.'
        expect(response).to redirect_to root_path
      end
    end

    context 'When Github authentication passes' do
      before(:each) do
        click_signin
      end

        specify { page.should have_content('Username') }
        specify { page.should have_content('Email') }
        specify { page.should have_content('Terms of Use') }
        specify { page.should_not have_css('password confirmation') }
        specify { page.should_not have_css('password required') }
      end

      context 'fill out signup form correctly' do
        before(:each) do
          fill_in_correctly
        end

        specify { page.should have_content('Welcome! You have signed up successfully.') }

        it 'should create user' do
          expect(User.where(provider: "github", uid: '123455', email: 'ghost@nobody.com'))
        end
      end

      context 'after signout' do
        before(:each) do
          click_signin
          fill_in_correctly
          click_link "Logout"
        end

        specify { page.should have_content('Signin with Github') }
      end

      context 'should be able to sign in again' do
        before(:each) do
          click_signin
          fill_in_correctly
          click_link "Logout"
          click_signin
        end

        specify { page.should have_content('Signed in!') }
      end

      context 'legal agreement not checked' do
        before(:each) do
          dont_check_legal_agreement
        end

        specify {page.should have_content('Don\'t forget the legal')}

        it 'should not create a user' do
          expect(User.any?).to eq(false)
        end
      end

      context 'username not entered ' do
        it 'should not create a user' do
          click_signin
          fill_in('user_email', :with => "ghost@nobody.com")
          check('user_legal_agreement')
          click_button('Sign up')
          expect(User.any?).to eq(false)
        end
      end

      context 'email not entered' do
        it 'should not create a user' do
          click_signin
          fill_in('user_username', :with => "GhostMan")
          fill_in('user_email', :with => "ghost@nobody.com")
          click_button('Sign up')
          expect(User.any?).to eq(false)
        end
      end
  end
end



