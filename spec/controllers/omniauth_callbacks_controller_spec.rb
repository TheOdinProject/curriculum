require 'spec_helper'

def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  @env = { "omniauth.auth" => { "provider" => "github", "uid" => "1234","legal_agreement" => true, "extra" => { "user_hash" => { "email" => "ghost@nobody.com", "username" => "GhostMan" } } } }
  request.env["omniauth.auth"] = @env["omniauth.auth"]
end

def click_signin_with_github
  visit login_path
  click_link "Sign in with Github"
end

def fill_in_correctly
  visit login_path
  click_link "Sign in with Github"
  fill_in('user_username', :with => "GhostMan")
  fill_in('user_email', :with => "ghost@nobody.com")
  check('user_legal_agreement')
  click_button('Sign up')
end

def dont_check_legal_agreement
  visit login_path
  click_link "Sign in with Github"
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
        click_signin_with_github
      end

        specify { page.should have_css('#user_username') }
        specify { page.should have_css('#user_email') }
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
          puts request.env['omniauth.env']
          puts " \n\n\n\n\n #{request.env['omniauth.auth'].inspect} \n\n\n\n\n\n"
          expect(User.where(provider: "github", uid: '123455', email: 'ghost@nobody.com').first)
        end
      end

      context 'after signout' do
        before(:each) do
          click_signin_with_github
          fill_in_correctly
          click_link "Logout"
          click_link "Login"
        end
        specify { find_link('Sign in with Github').visible? }
      end

      context 'should be able to sign in again' do
        before(:each) do
          fill_in_correctly
          click_link "Logout"

          click_signin_with_github
        end
        #auth = request.env["omniauth.auth"]
        #fixed with #{authorization.provider}
        it "should flash notice \"Thanks for logging in with Default\n" do
          page.should have_content("Thanks for logging in with Default")
        end
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
          click_signin_with_github
          fill_in('user_email', :with => "ghost@nobody.com")
          check('user_legal_agreement')
          click_button('Sign up')
          expect(User.any?).to eq(false)
        end
      end

      context 'email not entered' do
        it 'should not create a user' do
          click_signin_with_github
          fill_in('user_username', :with => "GhostMan")
          fill_in('user_email', :with => "ghost@nobody.com")
          click_button('Sign up')
          expect(User.any?).to eq(false)
        end
      end
  end

  context 'existing user with same email as Github' do
    context 'create user via devise sign up'
      before do
        @user = User.create(username: "Existing User",
                          email: "ghost@nobody.com",
                          password: "password",
                          password_confirmation: "password",
                          legal_agreement: true)
      end
      it 'should create a user with blank provider and uid' do
        expect(@user.provider).to eq(nil)
        expect(@user.uid).to eq(nil)
      end

      context 'existing user log in with Github with same email address' do
        before do
          @user = User.create(username: "Existing User",
                              email: "ghost@nobody.com",
                              password: "password",
                              password_confirmation: "password",
                              legal_agreement: true)
          visit root_path
          click_signin_with_github
        end

        it 'should tell the user to login to his/her existing account, and link the account on the profile page' do
          expect(@user.provider).to eq(nil)
          page.should have_css('.signup-prompt-msg')
        end
      end

      context 'if existing user signs in and tries goes to profile page to link github' do
       let (:user){User.create!(username: "Example User",
                    email: "exampleuser@none.com",
                    password: "password",
                    password_confirmation: "password",
                    legal_agreement: true)}

        before do
          user.reload
          visit root_path
          click_link('Login')
          fill_in('user_email', :with => "exampleuser@none.com")
          fill_in('user_password', :with => 'password')
          click_button('Sign in')
          click_link('Profile')
          click_on('github-link')
          user.reload
        end

        it 'should update existing user provider and uid' do
          user.reload
          expect(user.provider).to eq("default")
          expect(user.uid).to eq("1234")
        end

      end
    end
  end



