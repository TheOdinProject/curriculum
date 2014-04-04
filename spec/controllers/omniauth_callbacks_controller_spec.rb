require 'spec_helper'
# include Devise::TestHelpers

# describe OmniauthCallbacksController do


#   let!(:user) { FactoryGirl.create(:user) }

#   it "making a request without cookie token " do
#     get "/users/auth/github/callback"
#     last_response.status.should eql(401)
#     error = {:error=>'You need to sign in or sign up before continuing.'}
#     last_response.body.should  eql(error.to_json)
#   end

# end

describe OmniauthCallbacksController, "handle github authentication callback" do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end
  describe 'click Signin with Github' do
    context 'shows signup page' do
      before(:each) do
        stub_env_for_omniauth
        visit root_path
        click_link "Signin with Github"
      end

      it { page.should have_content('Username') }
      it { page.should have_content('Email') }
      it { page.should have_content('Terms of Use') }
      it { page.should_not have_css('password confirmation') }
      it { page.should_not have_css('password required') }
    end

    context 'fill out signup form correctly' do
      before(:each) do
        stub_env_for_omniauth
        visit root_path
        click_link "Signin with Github"
        fill_in('user_username', :with => "GhostMan")
        fill_in('user_email', :with => "ghost@nobody.com")
        check('user_legal_agreement')

        # puts "hello"
        # puts find(:css, '#user_username').value
        # puts find(:css, '#user_email').value
        # puts find(:css, '#user_legal_agreement').value
        # puts find_button('Sign up').value
        # find_button('Sign up').click
        # sleep 5
        # puts "done sleeping"



        click_button('Sign up')


        puts page.source
      end

      it { page.should have_content('can\'t be blank') }
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

