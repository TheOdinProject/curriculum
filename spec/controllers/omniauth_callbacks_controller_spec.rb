require 'spec_helper'

describe OmniauthCallbacksController, "github callback" do

  describe 'Github signup' do
    context 'When Github authentication fails' do
      it 'should render a failure message' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :failure
        expect(flash[:alert]).to eq 'Authentication failed.'
        expect(response).to redirect_to root_path
      end
    end

    describe 'Github sign-in page step 2' do
      before(:each) do
        click_signin_with_github
      end

      specify { expect(page).to have_css('#user_username') }
      specify { expect(page).to have_css('#user_email') }
      specify { expect(page).to have_content('Terms of Use') }
      specify { expect(page).not_to have_css('password confirmation') }
      specify { expect(page).not_to have_css('password required') }
    end


    context 'After signing up with Github' do
      before(:each) do
        # This little guy will prompt an infinite redirect
        # If the code isn't set up to handle query strings
        visit login_path(:ref=>"homenav")
        sign_up_with_github
      end

      specify do
        expect(page).to have_content('Welcome! You have signed up successfully.')
      end

      it 'should create user' do
        expect(User.where(provider: "default", uid: '1234').count).to eq(1)
      end
    end

    context 'after signout' do
      before(:each) do
        sign_up_with_github
        click_link "Logout"
        click_link "Login"
      end
      specify { find_link('Sign in with Github').visible? }
    end

    context 'should be able to sign in again' do
      before(:each) do
        sign_up_with_github
        click_link "Logout"

        click_signin_with_github
      end
      #auth = request.env["omniauth.auth"]
      #fixed with #{authorization.provider}
      it "should flash notice \"Thanks for logging in with Default\n" do
        expect(page).to have_content("Thanks for logging in with Default")
      end
    end

    context 'legal agreement not checked' do
      before(:each) do
        attempt_sign_in_no_legal_agreement
      end

      specify {expect(page).to have_content('Don\'t forget the legal')}

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


  context 'an existing user created with standard signup (e.g. has password)' do

    let(:normal_user){ User.create(
                        username: "Existing User",
                        email: "ghost@nobody.com",
                        password: "password",
                        password_confirmation: "password",
                        legal_agreement: true) }

    it 'should create a user with blank provider and uid' do
      expect(normal_user.provider).to eq(nil)
      expect(normal_user.uid).to eq(nil)
    end

    context 'tries to log in with a Github account having the same email address' do
      before do
        click_signin_with_github
      end

      it 'should tell the user to login to his/her existing account, and link the account on the profile page' do
        expect(normal_user.provider).to eq(nil)
        expect(page).to have_css('.signup-prompt-msg')
      end
    end

    context 'signs in' do

      before do
        # sign_in(normal_user) # Why the hell doesn't this work?  The next 4 lines are identical to it.
        visit login_path
        fill_in "Email", :with => normal_user.email
        fill_in "Password", :with => normal_user.password
        click_button "Sign in"
      end

      context 'and goes to profile page' do

        before { visit user_path(normal_user) }

        context 'and clicks on the Link to Github button' do
          before do
            click_on('github-link')
          end

          it 'should update existing user provider and uid' do
            normal_user.reload
            expect(normal_user.provider).to eq("default")
            expect(normal_user.uid).to eq("1234")
          end
        end
      end
    end
  end
end
