require 'spec_helper'

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

  describe 'When github authentication fails' do
    it 'should render a failure message on unsuccessful authentication' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :failure
      expect(flash[:alert]).to eq 'Authentication failed.'
      expect(response).to redirect_to root_path
    end
  end

  describe 'click Signin with Github' do
    context 'show signup page' do
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

    context 'do not fill legal_agreement' do
      before(:each) do
        dont_check_legal_agreement
      end

      specify {page.should have_content('Don\'t forget the legal')}
      it 'should not create a user' do
        expect(User.any?).to eq(false)
      end
    end

    context 'does not fill in username' do
      it 'should not create a user' do
        click_signin
        fill_in('user_email', :with => "ghost@nobody.com")
        check('user_legal_agreement')
        click_button('Sign up')
        expect(User.any?).to eq(false)
      end
    end

    context 'does not provide an email' do
      it 'should not create a user' do
        click_signin
        fill_in('user_username', :with => "GhostMan")
        fill_in('user_email', :with => "ghost@nobody.com")
        click_button('Sign up')
        expect(User.any?).to eq(false)
      end
    end

  end

  # describe "#annonymous user" do
  #   context "when github email doesn't exist in the system" do
  #     before(:each) do
  #       stub_env_for_omniauth
  #       visit root_path
  #       click_link "Signin with Github"

  #       @user = User.where(:email => "ghost@nobody.com").first
  #     end

  #     it { @user.should_not be_nil }

  #     it "should create authentication with github id" do
  #       authentication = @user.authentications.where(:provider => "github", :uid => "1234", legal_agreement: true).first
  #       authentication.should_not be_nil
  #     end

  #     it { should be_user_signed_in }

  #     it { response.should redirect_to tasks_path }
  #   end

  #   context "when github email already exist in the system" do
  #     before(:each) do
  #       stub_env_for_omniauth

  #       User.create!(:email => "ghost@nobody.com", :password => "my_secret", legal_agreement: true)
  #       get :github
  #     end

  #     it { flash[:notice].should == "Your email ghost@nobody.com is already exist in the system. You need to sign in first."}

  #     it { response.should redirect_to new_user_session_path }
  #   end
  # end

  # describe "#logged in user" do
  #   context "when user don't have github authentication" do
  #     before(:each) do
  #       stub_env_for_omniauth

  #       user = User.create!(:email => "user1@example.com", :password => "my_secret", legal_agreement: true)
  #       sign_in user

  #       get :github
  #     end

  #     it "should add github authentication to current user" do
  #       user = User.where(:email => "user1@example.com").first
  #       user.should_not be_nil
  #       fb_authentication = user.authentications.where(:provider => "github").first
  #       fb_authentication.should_not be_nil
  #       fb_authentication.uid.should == "1234"
  #     end

  #     it { should be_user_signed_in }

  #     it { response.should redirect_to authentications_path }

  #     it { flash[:notice].should == "github is connected with your account."}
  #   end

  #   context "when user already connect with github" do
  #     before(:each) do
  #       stub_env_for_omniauth

  #       user = User.create!(:email => "ghost@nobody.com", :password => "my_secret", legal_agreement: true)
  #       user.authentications.create!(:provider => "github", :uid => "1234")
  #       sign_in user

  #       get :github
  #     end

  #     xit "should not add new github authentication" do
  #       user = User.where(:email => "ghost@nobody.com").first
  #       user.should_not be_nil
  #       fb_authentications = user.authentications.where(:provider => "github")
  #       fb_authentications.count.should == 1
  #     end

  #     xit { should be_user_signed_in }

  #     xit { flash[:notice].should == "Signed in successfully." }

  #     xit { response.should redirect_to tasks_path }

  #   end
  # end

end

def stub_env_for_omniauth
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  env = { "omniauth.auth" => { "provider" => "github", "uid" => "123455","legal_agreement" => true, "extra" => { "user_hash" => { "email" => "ghost@nobody.com" } } } }
  request.env["omniauth.auth"] = env["omniauth.auth"]
end

